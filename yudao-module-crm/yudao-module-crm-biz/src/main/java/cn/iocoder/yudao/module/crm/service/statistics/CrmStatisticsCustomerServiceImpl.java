package cn.iocoder.yudao.module.crm.service.statistics;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.util.ObjUtil;
import cn.iocoder.yudao.framework.common.util.collection.MapUtils;
import cn.iocoder.yudao.framework.common.util.number.NumberUtils;
import cn.iocoder.yudao.module.crm.controller.admin.statistics.vo.customer.*;
import cn.iocoder.yudao.module.crm.dal.mysql.statistics.CrmStatisticsCustomerMapper;
import cn.iocoder.yudao.module.crm.enums.common.CrmBizTypeEnum;
import cn.iocoder.yudao.module.system.api.dept.DeptApi;
import cn.iocoder.yudao.module.system.api.dept.dto.DeptRespDTO;
import cn.iocoder.yudao.module.system.api.dict.DictDataApi;
import cn.iocoder.yudao.module.system.api.dict.dto.DictDataRespDTO;
import cn.iocoder.yudao.module.system.api.user.AdminUserApi;
import cn.iocoder.yudao.module.system.api.user.dto.AdminUserRespDTO;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import static cn.iocoder.yudao.framework.common.util.collection.CollectionUtils.*;
import static cn.iocoder.yudao.module.crm.enums.DictTypeConstants.*;

/**
 * CRM 客户分析 Service 实现类
 *
 * @author dhb52
 */
@Service
@Validated
public class CrmStatisticsCustomerServiceImpl implements CrmStatisticsCustomerService {

    private static final String SQL_DATE_FORMAT_BY_MONTH = "%Y%m";
    private static final String SQL_DATE_FORMAT_BY_DAY = "%Y%m%d";

    private static final String TIME_FORMAT_BY_MONTH = "yyyyMM";
    private static final String TIME_FORMAT_BY_DAY = "yyyyMMdd";


    @Resource
    private CrmStatisticsCustomerMapper customerMapper;

    @Resource
    private AdminUserApi adminUserApi;
    @Resource
    private DeptApi deptApi;
    @Resource
    private DictDataApi dictDataApi;


    @Override
    public List<CrmStatisticsCustomerSummaryByDateRespVO> getCustomerSummaryByDate(CrmStatisticsCustomerReqVO reqVO) {
        // 1. 获得用户编号数组
        final List<Long> userIds = getUserIds(reqVO);
        if (CollUtil.isEmpty(userIds)) {
            return Collections.emptyList();
        }
        reqVO.setUserIds(userIds);

        // 2. 获取分项统计数据
        reqVO.setSqlDateFormat(getSqlDateFormat(reqVO.getTimes()[0], reqVO.getTimes()[1]));
        final List<CrmStatisticsCustomerSummaryByDateRespVO> customerCreateCount = customerMapper.selectCustomerCreateCountGroupbyDate(reqVO);
        final List<CrmStatisticsCustomerSummaryByDateRespVO> customerDealCount = customerMapper.selectCustomerDealCountGroupbyDate(reqVO);

        // 3. 获取时间序列
        final List<String> times = generateTimeSeries(reqVO.getTimes()[0], reqVO.getTimes()[1]);

        // 4. 合并统计数据
        List<CrmStatisticsCustomerSummaryByDateRespVO> respVoList = new ArrayList<>(times.size());
        final Map<String, Integer> customerCreateCountMap = convertMap(customerCreateCount,
            CrmStatisticsCustomerSummaryByDateRespVO::getTime,
            CrmStatisticsCustomerSummaryByDateRespVO::getCustomerCreateCount);
        final Map<String, Integer> customerDealCountMap = convertMap(customerDealCount,
            CrmStatisticsCustomerSummaryByDateRespVO::getTime,
            CrmStatisticsCustomerSummaryByDateRespVO::getCustomerDealCount);
        times.forEach(time -> respVoList.add(
            new CrmStatisticsCustomerSummaryByDateRespVO().setTime(time)
                .setCustomerCreateCount(customerCreateCountMap.getOrDefault(time, 0))
                .setCustomerDealCount(customerDealCountMap.getOrDefault(time, 0))
        ));

        return respVoList;
    }

    @Override
    public List<CrmStatisticsCustomerSummaryByUserRespVO> getCustomerSummaryByUser(CrmStatisticsCustomerReqVO reqVO) {
        // 1. 获得用户编号数组
        final List<Long> userIds = getUserIds(reqVO);
        if (CollUtil.isEmpty(userIds)) {
            return Collections.emptyList();
        }
        reqVO.setUserIds(userIds);

        // 2. 获取分项统计数据
        final List<CrmStatisticsCustomerSummaryByUserRespVO> customerCreateCount = customerMapper.selectCustomerCreateCountGroupbyUser(reqVO);
        final List<CrmStatisticsCustomerSummaryByUserRespVO> customerDealCount = customerMapper.selectCustomerDealCountGroupbyUser(reqVO);
        final List<CrmStatisticsCustomerSummaryByUserRespVO> contractPrice = customerMapper.selectContractPriceGroupbyUser(reqVO);
        final List<CrmStatisticsCustomerSummaryByUserRespVO> receivablePrice = customerMapper.selectReceivablePriceGroupbyUser(reqVO);

        // 3. 合并统计数据
        final Map<Long, Integer> customerCreateCountMap = convertMap(customerCreateCount,
            CrmStatisticsCustomerSummaryByUserRespVO::getOwnerUserId,
            CrmStatisticsCustomerSummaryByUserRespVO::getCustomerCreateCount);
        final Map<Long, Integer> customerDealCountMap = convertMap(customerDealCount,
            CrmStatisticsCustomerSummaryByUserRespVO::getOwnerUserId,
            CrmStatisticsCustomerSummaryByUserRespVO::getCustomerDealCount);
        final Map<Long, BigDecimal> contractPriceMap = convertMap(contractPrice,
            CrmStatisticsCustomerSummaryByUserRespVO::getOwnerUserId,
            CrmStatisticsCustomerSummaryByUserRespVO::getContractPrice);
        final Map<Long, BigDecimal> receivablePriceMap = convertMap(receivablePrice,
            CrmStatisticsCustomerSummaryByUserRespVO::getOwnerUserId,
            CrmStatisticsCustomerSummaryByUserRespVO::getReceivablePrice);
        List<CrmStatisticsCustomerSummaryByUserRespVO> respVoList = new ArrayList<>(userIds.size());
        userIds.forEach(userId -> {
            final CrmStatisticsCustomerSummaryByUserRespVO vo = new CrmStatisticsCustomerSummaryByUserRespVO();
            vo.setOwnerUserId(userId);
            vo.setCustomerCreateCount(customerCreateCountMap.getOrDefault(userId, 0))
                .setCustomerDealCount(customerDealCountMap.getOrDefault(userId, 0))
                .setContractPrice(contractPriceMap.getOrDefault(userId, BigDecimal.ZERO))
                .setReceivablePrice(receivablePriceMap.getOrDefault(userId, BigDecimal.ZERO));
            respVoList.add(vo);
        });

        // 4. 拼接用户信息
        appendUserInfo(respVoList);

        return respVoList;
    }

    @Override
    public List<CrmStatisticsFollowupSummaryByDateRespVO> getFollowupSummaryByDate(CrmStatisticsCustomerReqVO reqVO) {
        // 1. 获得用户编号数组
        final List<Long> userIds = getUserIds(reqVO);
        if (CollUtil.isEmpty(userIds)) {
            return Collections.emptyList();
        }
        reqVO.setUserIds(userIds);

        // 2. 获取分项统计数据
        reqVO.setSqlDateFormat(getSqlDateFormat(reqVO.getTimes()[0], reqVO.getTimes()[1]));
        reqVO.setBizType(CrmBizTypeEnum.CRM_CUSTOMER.getType());
        final List<CrmStatisticsFollowupSummaryByDateRespVO> followupRecordCount = customerMapper.selectFollowupRecordCountGroupbyDate(reqVO);
        final List<CrmStatisticsFollowupSummaryByDateRespVO> followupCustomerCount = customerMapper.selectFollowupCustomerCountGroupbyDate(reqVO);

        // 3. 获取时间序列
        final List<String> times = generateTimeSeries(reqVO.getTimes()[0], reqVO.getTimes()[1]);

        // 4. 合并统计数据
        List<CrmStatisticsFollowupSummaryByDateRespVO> respVoList = new ArrayList<>(times.size());
        final Map<String, Integer> followupRecordCountMap = convertMap(followupRecordCount,
            CrmStatisticsFollowupSummaryByDateRespVO::getTime,
            CrmStatisticsFollowupSummaryByDateRespVO::getFollowupRecordCount);
        final Map<String, Integer> followupCustomerCountMap = convertMap(followupCustomerCount,
            CrmStatisticsFollowupSummaryByDateRespVO::getTime,
            CrmStatisticsFollowupSummaryByDateRespVO::getFollowupCustomerCount);
        times.forEach(time -> respVoList.add(
            new CrmStatisticsFollowupSummaryByDateRespVO().setTime(time)
                .setFollowupRecordCount(followupRecordCountMap.getOrDefault(time, 0))
                .setFollowupCustomerCount(followupCustomerCountMap.getOrDefault(time, 0))
        ));

        return respVoList;
    }

    @Override
    public List<CrmStatisticsFollowupSummaryByUserRespVO> getFollowupSummaryByUser(CrmStatisticsCustomerReqVO reqVO) {
        // 1. 获得用户编号数组
        final List<Long> userIds = getUserIds(reqVO);
        if (CollUtil.isEmpty(userIds)) {
            return Collections.emptyList();
        }
        reqVO.setUserIds(userIds);

        // 2. 获取分项统计数据
        reqVO.setBizType(CrmBizTypeEnum.CRM_CUSTOMER.getType());
        final List<CrmStatisticsFollowupSummaryByUserRespVO> followupRecordCount = customerMapper.selectFollowupRecordCountGroupbyUser(reqVO);
        final List<CrmStatisticsFollowupSummaryByUserRespVO> followupCustomerCount = customerMapper.selectFollowupCustomerCountGroupbyUser(reqVO);

        // 3. 合并统计数据
        final Map<Long, Integer> followupRecordCountMap = convertMap(followupRecordCount,
            CrmStatisticsFollowupSummaryByUserRespVO::getOwnerUserId,
            CrmStatisticsFollowupSummaryByUserRespVO::getFollowupRecordCount);
        final Map<Long, Integer> followupCustomerCountMap = convertMap(followupCustomerCount,
            CrmStatisticsFollowupSummaryByUserRespVO::getOwnerUserId,
            CrmStatisticsFollowupSummaryByUserRespVO::getFollowupCustomerCount);
        List<CrmStatisticsFollowupSummaryByUserRespVO> respVoList = new ArrayList<>(userIds.size());
        userIds.forEach(userId -> {
            final CrmStatisticsFollowupSummaryByUserRespVO vo = new CrmStatisticsFollowupSummaryByUserRespVO()
                .setFollowupRecordCount(followupRecordCountMap.getOrDefault(userId, 0))
                .setFollowupCustomerCount(followupCustomerCountMap.getOrDefault(userId, 0));
            vo.setOwnerUserId(userId);
            respVoList.add(vo);
        });

        // 4. 拼接用户信息
        appendUserInfo(respVoList);

        return respVoList;
    }

    @Override
    public List<CrmStatisticsFollowupSummaryByTypeRespVO> getFollowupSummaryByType(CrmStatisticsCustomerReqVO reqVO) {
        // 1. 获得用户编号数组
        final List<Long> userIds = getUserIds(reqVO);
        if (CollUtil.isEmpty(userIds)) {
            return Collections.emptyList();
        }
        reqVO.setUserIds(userIds);

        // 2. 获得排行数据
        reqVO.setBizType(CrmBizTypeEnum.CRM_CUSTOMER.getType());
        List<CrmStatisticsFollowupSummaryByTypeRespVO> respVoList = customerMapper.selectFollowupRecordCountGroupbyType(reqVO);

        // 3. 获取字典数据
        List<DictDataRespDTO> followUpTypes = dictDataApi.getDictDataList(CRM_FOLLOW_UP_TYPE);
        final Map<String, String> followUpTypeMap = convertMap(followUpTypes,
            DictDataRespDTO::getValue, DictDataRespDTO::getLabel);
        respVoList.forEach(vo -> {
            vo.setFollowupType(followUpTypeMap.get(vo.getFollowupType()));
        });

        return respVoList;
    }

    @Override
    public List<CrmStatisticsCustomerContractSummaryRespVO> getContractSummary(CrmStatisticsCustomerReqVO reqVO) {
        // 1. 获得用户编号数组
        final List<Long> userIds = getUserIds(reqVO);
        if (CollUtil.isEmpty(userIds)) {
            return Collections.emptyList();
        }
        reqVO.setUserIds(userIds);

        // 2. 获取统计数据
        List<CrmStatisticsCustomerContractSummaryRespVO> respVoList = customerMapper.selectContractSummary(reqVO);

        // 3. 设置 创建人、负责人、行业、来源
        // 获取客户所属行业
        Map<String, String> industryMap = convertMap(dictDataApi.getDictDataList(CRM_CUSTOMER_INDUSTRY),
            DictDataRespDTO::getValue, DictDataRespDTO::getLabel);
        // 获取客户来源
        Map<String, String> sourceMap = convertMap(dictDataApi.getDictDataList(CRM_CUSTOMER_SOURCE),
            DictDataRespDTO::getValue, DictDataRespDTO::getLabel);
        // 获取创建人、负责人列表
        Map<Long, AdminUserRespDTO> userMap = adminUserApi.getUserMap(convertSetByFlatMap(respVoList,
            vo -> Stream.of(NumberUtils.parseLong(vo.getCreatorUserId()), vo.getOwnerUserId())));

        respVoList.forEach(vo -> {
            MapUtils.findAndThen(industryMap, vo.getIndustryId(), vo::setIndustryName);
            MapUtils.findAndThen(sourceMap, vo.getSource(), vo::setSourceName);
            MapUtils.findAndThen(userMap, NumberUtils.parseLong(vo.getCreatorUserId()),
                user -> vo.setCreatorUserName(user.getNickname()));
            MapUtils.findAndThen(userMap, vo.getOwnerUserId(), user -> vo.setOwnerUserName(user.getNickname()));
        });

        return respVoList;
    }

    @Override
    public List<CrmStatisticsCustomerDealCycleByDateRespVO> getCustomerDealCycleByDate(CrmStatisticsCustomerReqVO reqVO) {
        // 1. 获得用户编号数组
        final List<Long> userIds = getUserIds(reqVO);
        if (CollUtil.isEmpty(userIds)) {
            return Collections.emptyList();
        }
        reqVO.setUserIds(userIds);

        // 2. 获取分项统计数据
        reqVO.setSqlDateFormat(getSqlDateFormat(reqVO.getTimes()[0], reqVO.getTimes()[1]));
        reqVO.setBizType(CrmBizTypeEnum.CRM_CUSTOMER.getType());
        final List<CrmStatisticsCustomerDealCycleByDateRespVO> customerDealCycle = customerMapper.selectCustomerDealCycleGroupbyDate(reqVO);

        // 3. 获取时间序列
        final List<String> times = generateTimeSeries(reqVO.getTimes()[0], reqVO.getTimes()[1]);

        // 4. 合并统计数据
        List<CrmStatisticsCustomerDealCycleByDateRespVO> respVoList = new ArrayList<>(times.size());
        final Map<String, Double> customerDealCycleMap = convertMap(customerDealCycle,
            CrmStatisticsCustomerDealCycleByDateRespVO::getTime,
            CrmStatisticsCustomerDealCycleByDateRespVO::getCustomerDealCycle);
        times.forEach(time -> respVoList.add(
            new CrmStatisticsCustomerDealCycleByDateRespVO().setTime(time)
                .setCustomerDealCycle(customerDealCycleMap.getOrDefault(time, 0D))
        ));

        return respVoList;
    }

    @Override
    public List<CrmStatisticsCustomerDealCycleByUserRespVO> getCustomerDealCycleByUser(CrmStatisticsCustomerReqVO reqVO) {
        // 1. 获得用户编号数组
        final List<Long> userIds = getUserIds(reqVO);
        if (CollUtil.isEmpty(userIds)) {
            return Collections.emptyList();
        }
        reqVO.setUserIds(userIds);

        // 2. 获取分项统计数据
        reqVO.setBizType(CrmBizTypeEnum.CRM_CUSTOMER.getType());
        final List<CrmStatisticsCustomerDealCycleByUserRespVO> customerDealCycle = customerMapper.selectCustomerDealCycleGroupbyUser(reqVO);
        final List<CrmStatisticsCustomerSummaryByUserRespVO> customerDealCount = customerMapper.selectCustomerDealCountGroupbyUser(reqVO);

        // 3. 合并统计数据
        final Map<Long, Double> customerDealCycleMap = convertMap(customerDealCycle,
            CrmStatisticsCustomerDealCycleByUserRespVO::getOwnerUserId,
            CrmStatisticsCustomerDealCycleByUserRespVO::getCustomerDealCycle);
        final Map<Long, Integer> customerDealCountMap = convertMap(customerDealCount,
            CrmStatisticsCustomerSummaryByUserRespVO::getOwnerUserId,
            CrmStatisticsCustomerSummaryByUserRespVO::getCustomerDealCount);
        List<CrmStatisticsCustomerDealCycleByUserRespVO> respVoList = new ArrayList<>(userIds.size());
        userIds.forEach(userId -> {
            final CrmStatisticsCustomerDealCycleByUserRespVO vo = new CrmStatisticsCustomerDealCycleByUserRespVO()
                .setCustomerDealCycle(customerDealCycleMap.getOrDefault(userId, 0.0))
                .setCustomerDealCount(customerDealCountMap.getOrDefault(userId, 0));
            vo.setOwnerUserId(userId);
            respVoList.add(vo);
        });

        // 4. 拼接用户信息
        appendUserInfo(respVoList);

        return respVoList;
    }

    /**
     * 拼接用户信息（昵称）
     *
     * @param respVoList 统计数据
     */
    private <T extends CrmStatisticsCustomerByUserBaseRespVO> void appendUserInfo(List<T> respVoList) {
        Map<Long, AdminUserRespDTO> userMap = adminUserApi.getUserMap(convertSet(respVoList,
            CrmStatisticsCustomerByUserBaseRespVO::getOwnerUserId));
        respVoList.forEach(vo -> MapUtils.findAndThen(userMap,
            vo.getOwnerUserId(), user -> vo.setOwnerUserName(user.getNickname())));
    }

    /**
     * 获取用户编号数组。如果用户编号为空, 则获得部门下的用户编号数组，包括子部门的所有用户编号
     *
     * @param reqVO 请求参数
     * @return 用户编号数组
     */
    private List<Long> getUserIds(CrmStatisticsCustomerReqVO reqVO) {
        if (ObjUtil.isNotNull(reqVO.getUserId())) {
            return List.of(reqVO.getUserId());
        } else {
            // 1. 获得部门列表
            final Long deptId = reqVO.getDeptId();
            List<Long> deptIds = convertList(deptApi.getChildDeptList(deptId), DeptRespDTO::getId);
            deptIds.add(deptId);
            // 2. 获得用户编号
            return convertList(adminUserApi.getUserListByDeptIds(deptIds), AdminUserRespDTO::getId);
        }
    }


    /**
     * 判断是否按照 月粒度 统计
     *
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @return 是, 按月粒度, 否则按天粒度统计。
     */
    private boolean queryByMonth(LocalDateTime startTime, LocalDateTime endTime) {
        return LocalDateTimeUtil.between(startTime, endTime).toDays() > 31;
    }

    /**
     * 生成时间序列
     *
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @return 时间序列
     */
    private List<String> generateTimeSeries(LocalDateTime startTime, LocalDateTime endTime) {
        boolean byMonth = queryByMonth(startTime, endTime);
        List<String> times = CollUtil.newArrayList();
        while (!startTime.isAfter(endTime)) {
            times.add(LocalDateTimeUtil.format(startTime, byMonth ? TIME_FORMAT_BY_MONTH : TIME_FORMAT_BY_DAY));
            if (byMonth)
                startTime = startTime.plusMonths(1);
            else
                startTime = startTime.plusDays(1);
        }

        return times;
    }

    /**
     * 获取 SQL 查询 GROUP BY 的时间格式
     *
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @return SQL 查询 GROUP BY 的时间格式
     */
    private String getSqlDateFormat(LocalDateTime startTime, LocalDateTime endTime) {
        return queryByMonth(startTime, endTime) ? SQL_DATE_FORMAT_BY_MONTH : SQL_DATE_FORMAT_BY_DAY;
    }

}
