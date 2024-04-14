package cn.iocoder.yudao.module.crm.service.statistics;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.crm.controller.admin.statistics.vo.funnel.CrmStatisticBusinessEndStatusRespVO;
import cn.iocoder.yudao.module.crm.controller.admin.statistics.vo.funnel.CrmStatisticFunnelRespVO;
import cn.iocoder.yudao.module.crm.controller.admin.statistics.vo.funnel.CrmStatisticsBusinessSummaryByDateRespVO;
import cn.iocoder.yudao.module.crm.controller.admin.statistics.vo.funnel.CrmStatisticsFunnelReqVO;
import cn.iocoder.yudao.module.crm.dal.dataobject.business.CrmBusinessDO;

import java.util.List;

/**
 * CRM 销售漏斗分析 Service
 *
 * @author HUIHUI
 */
public interface CrmStatisticsFunnelService {

    /**
     * 获得销售漏斗数据
     *
     * @param reqVO 请求
     * @return 销售漏斗数据
     */
    CrmStatisticFunnelRespVO getFunnelSummary(CrmStatisticsFunnelReqVO reqVO);

    /**
     * 获得商机结束状态统计
     *
     * @param reqVO 请求
     * @return 商机结束状态统计
     */
    List<CrmStatisticBusinessEndStatusRespVO> getBusinessEndStatusSummary(CrmStatisticsFunnelReqVO reqVO);

    /**
     * 获取新增商机分析(按日期)
     *
     * @param reqVO 请求
     * @return 新增商机分析
     */
    List<CrmStatisticsBusinessSummaryByDateRespVO> getBusinessSummaryByDate(CrmStatisticsFunnelReqVO reqVO);

    /**
     * 获得商机分页(按日期)
     *
     * @param pageVO 请求
     * @return 商机分页
     */
    PageResult<CrmBusinessDO> getBusinessPageByDate(CrmStatisticsFunnelReqVO pageVO);

}
