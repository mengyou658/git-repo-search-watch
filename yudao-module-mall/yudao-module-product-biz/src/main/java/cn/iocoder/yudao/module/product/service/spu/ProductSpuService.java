package cn.iocoder.yudao.module.product.service.spu;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.product.controller.admin.spu.vo.*;
import cn.iocoder.yudao.module.product.controller.app.spu.vo.AppSpuPageReqVO;
import cn.iocoder.yudao.module.product.controller.app.spu.vo.AppSpuPageRespVO;
import cn.iocoder.yudao.module.product.dal.dataobject.spu.ProductSpuDO;

import javax.validation.Valid;
import java.util.Collection;
import java.util.List;

/**
 * 商品 SPU Service 接口
 *
 * @author 芋道源码
 */
public interface ProductSpuService {

    /**
     * 创建商品 SPU
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createSpu(@Valid ProductSpuCreateReqVO createReqVO);

    /**
     * 更新商品 SPU
     *
     * @param updateReqVO 更新信息
     */
    void updateSpu(@Valid ProductSpuUpdateReqVO updateReqVO);

    /**
     * 删除商品 SPU
     *
     * @param id 编号
     */
    void deleteSpu(Long id);

    /**
     * 获得商品 SPU 详情
     *
     * @param id 编号
     * @return 商品 SPU
     */
    ProductSpuDetailRespVO getSpuDetail(Long id);

    /**
     * 获得商品 SPU
     *
     * @param id 编号
     * @return 商品 SPU
     */
    ProductSpuRespVO getSpu(Long id);

    /**
     * 获得商品 SPU 列表
     *
     * @param ids 编号数组
     * @return 商品 SPU 列表
     */
    List<ProductSpuDO> getSpuList(Collection<Long> ids);

    /**
     * 获得商品 SPU 分页
     *
     * @param pageReqVO 分页查询
     * @return 商品spu分页
     */
    PageResult<ProductSpuRespVO> getSpuPage(ProductSpuPageReqVO pageReqVO);

    /**
     * 获得商品 SPU 分页 // TODO @luowenfeng: 中文和英文之间, 要有一个空格; 这样, 阅读起来会更清晰; 我已经都改啦
     *
     * @param pageReqVO 分页查询
     * @return 商品spu分页
     */
    PageResult<AppSpuPageRespVO> getSpuPage(AppSpuPageReqVO pageReqVO);

}
