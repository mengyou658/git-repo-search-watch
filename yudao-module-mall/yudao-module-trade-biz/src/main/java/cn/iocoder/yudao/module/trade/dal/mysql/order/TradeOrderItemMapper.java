package cn.iocoder.yudao.module.trade.dal.mysql.order;

import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.trade.dal.dataobject.order.TradeOrderItemDO;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.Collection;
import java.util.List;

@Mapper
public interface TradeOrderItemMapper extends BaseMapperX<TradeOrderItemDO> {

    default int updateAfterSaleStatus(Long id, Integer oldAfterSaleStatus, Integer newAfterSaleStatus,
                                      Long afterSaleId) {
        return update(new TradeOrderItemDO().setAfterSaleStatus(newAfterSaleStatus).setAfterSaleId(afterSaleId),
                new LambdaUpdateWrapper<>(new TradeOrderItemDO().setId(id).setAfterSaleStatus(oldAfterSaleStatus)));
    }

    default List<TradeOrderItemDO> selectListByOrderId(Long orderId) {
        return selectList(TradeOrderItemDO::getOrderId, orderId);
    }

    default List<TradeOrderItemDO> selectListByOrderId(Collection<Long> orderIds) {
        return selectList(TradeOrderItemDO::getOrderId, orderIds);
    }

    default TradeOrderItemDO selectByIdAndUserId(Long orderItemId, Long loginUserId) {
        return selectOne(new LambdaQueryWrapperX<TradeOrderItemDO>()
                .eq(TradeOrderItemDO::getId, orderItemId)
                .eq(TradeOrderItemDO::getUserId, loginUserId));
    }

    default List<TradeOrderItemDO> selectListByOrderIdAndCommentStatus(Long orderId, Boolean commentStatus) {
        return selectList(new LambdaQueryWrapperX<TradeOrderItemDO>()
                .eq(TradeOrderItemDO::getOrderId, orderId)
                .eq(TradeOrderItemDO::getCommentStatus, commentStatus));
    }

}
