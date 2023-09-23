package cn.iocoder.yudao.module.trade.service.price.calculator;

import cn.iocoder.yudao.module.trade.service.price.bo.TradePriceCalculateReqBO;
import cn.iocoder.yudao.module.trade.service.price.bo.TradePriceCalculateRespBO;

/**
 * 价格计算的计算器接口
 *
 * 优惠计算顺序：
 * 1. <a href="https://help.youzan.com/displaylist/detail_4_4-1-53316">积分抵现、会员价、优惠券、粉丝专享价、满减送哪个优先计算？</>
 *
 * @author 芋道源码
 */
public interface TradePriceCalculator {

    int ORDER_MEMBER_LEVEL = 5;
    int ORDER_DISCOUNT_ACTIVITY = 10;
    int ORDER_REWARD_ACTIVITY = 20;
    int ORDER_COUPON = 30;
    int ORDER_POINT_USE = 40;
    /**
     * 快递运费的计算
     *
     * 放在各种营销活动、优惠劵后面 TODO
     */
    int ORDER_DELIVERY = 50;

    void calculate(TradePriceCalculateReqBO param, TradePriceCalculateRespBO result);

}
