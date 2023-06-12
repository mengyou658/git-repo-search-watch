package cn.iocoder.yudao.module.product.service.comment;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.product.controller.admin.comment.vo.ProductCommentCreateReqVO;
import cn.iocoder.yudao.module.product.controller.admin.comment.vo.ProductCommentPageReqVO;
import cn.iocoder.yudao.module.product.controller.admin.comment.vo.ProductCommentReplyVO;
import cn.iocoder.yudao.module.product.controller.admin.comment.vo.ProductCommentUpdateVisibleReqVO;
import cn.iocoder.yudao.module.product.controller.app.comment.vo.AppCommentPageReqVO;
import cn.iocoder.yudao.module.product.controller.app.comment.vo.AppCommentStatisticsRespVO;
import cn.iocoder.yudao.module.product.controller.app.comment.vo.AppProductCommentRespVO;
import cn.iocoder.yudao.module.product.convert.comment.ProductCommentConvert;
import cn.iocoder.yudao.module.product.dal.dataobject.comment.ProductCommentDO;
import cn.iocoder.yudao.module.product.dal.dataobject.spu.ProductSpuDO;
import cn.iocoder.yudao.module.product.dal.mysql.comment.ProductCommentMapper;
import cn.iocoder.yudao.module.product.service.spu.ProductSpuService;
import cn.iocoder.yudao.module.trade.api.order.TradeOrderApi;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;
import java.time.LocalDateTime;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.product.enums.ErrorCodeConstants.*;

/**
 * 商品评论 Service 实现类
 *
 * @author wangzhs
 */
@Service
@Validated
public class ProductCommentServiceImpl implements ProductCommentService {

    @Resource
    private ProductCommentMapper productCommentMapper;

    @Resource
    private TradeOrderApi tradeOrderApi;

    @Resource
    private ProductSpuService productSpuService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateCommentVisible(ProductCommentUpdateVisibleReqVO updateReqVO) {
        // 校验评论是否存在
        ProductCommentDO productCommentDO = validateCommentExists(updateReqVO.getId());
        productCommentDO.setVisible(updateReqVO.getVisible());

        // 更新可见状态
        productCommentMapper.updateById(productCommentDO);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void replyComment(ProductCommentReplyVO replyVO, Long loginUserId) {
        // 校验评论是否存在
        ProductCommentDO productCommentDO = validateCommentExists(replyVO.getId());
        productCommentDO.setReplyTime(LocalDateTime.now());
        productCommentDO.setReplyUserId(loginUserId);
        productCommentDO.setReplyStatus(Boolean.TRUE);
        productCommentDO.setReplyContent(replyVO.getReplyContent());

        // 回复评论
        productCommentMapper.updateById(productCommentDO);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createComment(ProductCommentCreateReqVO createReqVO) {
        // 校验订单
        Long orderId = tradeOrderApi.validateOrder(createReqVO.getUserId(), createReqVO.getOrderItemId());
        // 校验评论
        validateComment(createReqVO.getSpuId(), createReqVO.getUserId(), orderId);

        ProductCommentDO commentDO = ProductCommentConvert.INSTANCE.convert(createReqVO);
        productCommentMapper.insert(commentDO);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long createComment(ProductCommentDO commentDO) {
        // 校验评论
        validateComment(commentDO.getSpuId(), commentDO.getUserId(), commentDO.getOrderId());

        productCommentMapper.insert(commentDO);
        return commentDO.getId();
    }

    // TODO 只有创建和更新诶 要不要删除接口

    private void validateComment(Long spuId, Long userId, Long orderId) {
        ProductSpuDO spu = productSpuService.getSpu(spuId);
        if (null == spu) {
            throw exception(SPU_NOT_EXISTS);
        }
        // 判断当前订单的当前商品用户是否评价过
        ProductCommentDO exist = productCommentMapper.selectByUserIdAndOrderIdAndSpuId(userId, orderId, spuId);
        if (null != exist) {
            throw exception(ORDER_SPU_COMMENT_EXISTS);
        }
    }

    private ProductCommentDO validateCommentExists(Long id) {
        ProductCommentDO productComment = productCommentMapper.selectById(id);
        if (productComment == null) {
            throw exception(COMMENT_NOT_EXISTS);
        }
        return productComment;
    }

    @Override
    public AppCommentStatisticsRespVO getCommentPageTabsCount(Long spuId, Boolean visible) {
        return ProductCommentConvert.INSTANCE.convert(
                // 查询商品 id = spuId 的所有评论数量
                productCommentMapper.selectCountBySpuId(spuId, visible, null),
                // 查询商品 id = spuId 的所有好评数量
                productCommentMapper.selectCountBySpuId(spuId, visible, AppCommentPageReqVO.GOOD_COMMENT),
                // 查询商品 id = spuId 的所有中评数量
                productCommentMapper.selectCountBySpuId(spuId, visible, AppCommentPageReqVO.MEDIOCRE_COMMENT),
                // 查询商品 id = spuId 的所有差评数量
                productCommentMapper.selectCountBySpuId(spuId, visible, AppCommentPageReqVO.NEGATIVE_COMMENT)
        );
    }

    @Override
    public PageResult<AppProductCommentRespVO> getCommentPage(AppCommentPageReqVO pageVO, Boolean visible) {
        return ProductCommentConvert.INSTANCE.convertPage02(productCommentMapper.selectPage(pageVO, visible));
    }

    @Override
    public PageResult<ProductCommentDO> getCommentPage(ProductCommentPageReqVO pageReqVO) {
        return productCommentMapper.selectPage(pageReqVO);
    }

}
