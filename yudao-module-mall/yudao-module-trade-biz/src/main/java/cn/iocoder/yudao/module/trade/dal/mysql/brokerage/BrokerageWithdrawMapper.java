package cn.iocoder.yudao.module.trade.dal.mysql.brokerage;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.trade.controller.admin.brokerage.vo.withdraw.BrokerageWithdrawPageReqVO;
import cn.iocoder.yudao.module.trade.dal.dataobject.brokerage.BrokerageWithdrawDO;
import cn.iocoder.yudao.module.trade.service.brokerage.bo.UserWithdrawSummaryBO;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 佣金提现 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface BrokerageWithdrawMapper extends BaseMapperX<BrokerageWithdrawDO> {

    default PageResult<BrokerageWithdrawDO> selectPage(BrokerageWithdrawPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<BrokerageWithdrawDO>()
                .eqIfPresent(BrokerageWithdrawDO::getUserId, reqVO.getUserId())
                .eqIfPresent(BrokerageWithdrawDO::getType, reqVO.getType())
                .likeIfPresent(BrokerageWithdrawDO::getName, reqVO.getName())
                .eqIfPresent(BrokerageWithdrawDO::getAccountNo, reqVO.getAccountNo())
                .likeIfPresent(BrokerageWithdrawDO::getBankName, reqVO.getBankName())
                .eqIfPresent(BrokerageWithdrawDO::getStatus, reqVO.getStatus())
                .betweenIfPresent(BrokerageWithdrawDO::getCreateTime, reqVO.getCreateTime())
                .orderByAsc(BrokerageWithdrawDO::getStatus).orderByDesc(BrokerageWithdrawDO::getId));
    }

    default int updateByIdAndStatus(Integer id, Integer status, BrokerageWithdrawDO updateObj) {
        return update(updateObj, new LambdaUpdateWrapper<BrokerageWithdrawDO>()
                .eq(BrokerageWithdrawDO::getId, id)
                .eq(BrokerageWithdrawDO::getStatus, status));
    }

    @Select("SELECT COUNT(1) AS count, SUM(price) AS price FROM trade_brokerage_withdraw " +
            "WHERE user_id = #{userId} AND status = #{status} AND deleted = FALSE")
    UserWithdrawSummaryBO selectCountAndSumPriceByUserIdAndStatus(@Param("userId") Long userId,
                                                                  @Param("status") Integer status);

}
