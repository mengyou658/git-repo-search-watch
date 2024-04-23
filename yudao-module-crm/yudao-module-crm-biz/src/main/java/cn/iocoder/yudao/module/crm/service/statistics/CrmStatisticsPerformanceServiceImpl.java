package cn.iocoder.yudao.module.crm.service.statistics;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.util.ObjUtil;
import cn.iocoder.yudao.module.crm.controller.admin.statistics.vo.performance.CrmStatisticsPerformanceReqVO;
import cn.iocoder.yudao.module.crm.controller.admin.statistics.vo.performance.CrmStatisticsPerformanceRespVO;
import cn.iocoder.yudao.module.crm.dal.mysql.statistics.CrmStatisticsPerformanceMapper;
import cn.iocoder.yudao.module.system.api.dept.DeptApi;
import cn.iocoder.yudao.module.system.api.dept.dto.DeptRespDTO;
import cn.iocoder.yudao.module.system.api.user.AdminUserApi;
import cn.iocoder.yudao.module.system.api.user.dto.AdminUserRespDTO;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import jakarta.annotation.Resource;

import java.math.BigDecimal;
import java.util.*;
import java.util.function.Function;

import static cn.iocoder.yudao.framework.common.util.collection.CollectionUtils.convertList;

/**
 * CRM 员工业绩分析 Service 实现类
 *
 * @author scholar
 */
@Service
@Validated
public class CrmStatisticsPerformanceServiceImpl implements CrmStatisticsPerformanceService {

    @Resource
    private CrmStatisticsPerformanceMapper performanceMapper;

    @Resource
    private AdminUserApi adminUserApi;
    @Resource
    private DeptApi deptApi;

    @Override
    public List<CrmStatisticsPerformanceRespVO> getContractCountPerformance(CrmStatisticsPerformanceReqVO performanceReqVO) {
        // TODO @scholar：我们可以换个思路实现，减少数据库的计算量；
        // 比如说，2024 年的合同数据，是不是 2022-12 到 2024-12-31，每个月的统计呢？
        // 理解之后，我们可以数据 group by 年-月，20222-12 到 2024-12-31 的，然后内存在聚合出 CrmStatisticsPerformanceRespVO 这样
        // 这样，我们就可以减少数据库的计算量，提升性能；同时 SQL 也会很简单，开发者理解起来也简单哈；
        return getPerformance(performanceReqVO, performanceMapper::selectContractCountPerformance);
    }

    @Override
    public List<CrmStatisticsPerformanceRespVO> getContractPricePerformance(CrmStatisticsPerformanceReqVO performanceReqVO) {
        return getPerformance(performanceReqVO, performanceMapper::selectContractPricePerformance);
    }

    @Override
    public List<CrmStatisticsPerformanceRespVO> getReceivablePricePerformance(CrmStatisticsPerformanceReqVO performanceReqVO) {
        return getPerformance(performanceReqVO, performanceMapper::selectReceivablePricePerformance);
    }

    /**
     * 获得员工业绩数据
     *
     * @param performanceReqVO  参数
     * @param performanceFunction 员工业绩统计方法
     * @return 员工业绩数据
     */
    private List<CrmStatisticsPerformanceRespVO> getPerformance(CrmStatisticsPerformanceReqVO performanceReqVO, Function<CrmStatisticsPerformanceReqVO,
            List<CrmStatisticsPerformanceRespVO>> performanceFunction) {

        List<CrmStatisticsPerformanceRespVO> performanceRespVOList;

        // 1. 获得用户编号数组
        final List<Long> userIds = getUserIds(performanceReqVO);
        if (CollUtil.isEmpty(userIds)) {
            return Collections.emptyList();
        }
        performanceReqVO.setUserIds(userIds);
        // 2. 获得业绩数据
        List<CrmStatisticsPerformanceRespVO> performance = performanceFunction.apply(performanceReqVO);

        // 获取查询的年份
        String currentYear = LocalDateTimeUtil.format(performanceReqVO.getTimes()[0],"yyyy");

        // 构造查询当年和前一年，每年12个月的年月组合
        List<String> allMonths = new ArrayList<>();
        for (int year = Integer.parseInt(currentYear)-1; year <= Integer.parseInt(currentYear); year++) {
            for (int month = 1; month <= 12; month++) {
                allMonths.add(String.format("%d%02d", year, month));
            }
        }

        List<CrmStatisticsPerformanceRespVO> computedList = new ArrayList<>();
        List<CrmStatisticsPerformanceRespVO> respVOList = new ArrayList<>();

        // 生成computedList基础数据
        // 构造完整的2*12个月的数据，如果某月数据缺失，需要补上0，一年12个月不能有缺失
        for (String month : allMonths) {
            CrmStatisticsPerformanceRespVO foundData = performance.stream()
                    .filter(data -> data.getTime().equals(month))
                    .findFirst()
                    .orElse(null);

            if (foundData != null) {
                computedList.add(foundData);
            } else {
                CrmStatisticsPerformanceRespVO missingData = new CrmStatisticsPerformanceRespVO();
                missingData.setTime(month);
                missingData.setCurrentMonthCount(BigDecimal.ZERO);
                missingData.setLastMonthCount(BigDecimal.ZERO);
                missingData.setLastYearCount(BigDecimal.ZERO);
                computedList.add(missingData);
            }
        }
        //根据查询年份和前一年的数据，计算查询年份的同比环比数据
        for (CrmStatisticsPerformanceRespVO currentData : computedList) {
            String currentMonth = currentData.getTime();

            // 根据当年和前一年的月销售数据，计算currentYear的完整数据
            if (currentMonth.startsWith(currentYear)) {
                // 计算 LastMonthCount
                int currentIndex = computedList.indexOf(currentData);
                if (currentIndex > 0) {
                    CrmStatisticsPerformanceRespVO lastMonthData = computedList.get(currentIndex - 1);
                    currentData.setLastMonthCount(lastMonthData.getCurrentMonthCount());
                } else {
                    currentData.setLastMonthCount(BigDecimal.ZERO); // 第一个月的 LastMonthCount 设为0
                }

                // 计算 LastYearCount
                String lastYearMonth = String.valueOf(Integer.parseInt(currentMonth) - 100);
                CrmStatisticsPerformanceRespVO lastYearData = computedList.stream()
                        .filter(data -> data.getTime().equals(lastYearMonth))
                        .findFirst()
                        .orElse(null);

                if (lastYearData != null) {
                    currentData.setLastYearCount(lastYearData.getCurrentMonthCount());
                } else {
                    currentData.setLastYearCount(BigDecimal.ZERO); // 如果去年同月数据不存在，设为0
                }
                respVOList.add(currentData);//给前端只需要返回查询当年的数据，不需要前一年数据
            }
        }
        return respVOList;
    }

    /**
     * 获取用户编号数组。如果用户编号为空, 则获得部门下的用户编号数组，包括子部门的所有用户编号
     *
     * @param reqVO 请求参数
     * @return 用户编号数组
     */
    private List<Long> getUserIds(CrmStatisticsPerformanceReqVO reqVO) {
        // 情况一：选中某个用户
        if (ObjUtil.isNotNull(reqVO.getUserId())) {
            return List.of(reqVO.getUserId());
        }
        // 情况二：选中某个部门
        // 2.1 获得部门列表
        final Long deptId = reqVO.getDeptId();
        List<Long> deptIds = convertList(deptApi.getChildDeptList(deptId), DeptRespDTO::getId);
        deptIds.add(deptId);
        // 2.2 获得用户编号
        return convertList(adminUserApi.getUserListByDeptIds(deptIds), AdminUserRespDTO::getId);
    }

}