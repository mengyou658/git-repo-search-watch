package cn.iocoder.yudao.module.crm.service.product;

import cn.iocoder.yudao.module.crm.controller.admin.product.vo.productcategory.CrmProductCategoryCreateReqVO;
import cn.iocoder.yudao.module.crm.controller.admin.product.vo.productcategory.CrmProductCategoryListReqVO;
import cn.iocoder.yudao.module.crm.controller.admin.product.vo.productcategory.CrmProductCategoryUpdateReqVO;
import cn.iocoder.yudao.module.crm.dal.dataobject.product.CrmProductCategoryDO;

import javax.validation.Valid;
import java.util.List;

/**
 * 产品分类 Service 接口
 *
 * @author ZanGe丶
 */
public interface CrmProductCategoryService {

    /**
     * 创建产品分类
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createProductCategory(@Valid CrmProductCategoryCreateReqVO createReqVO);

    /**
     * 更新产品分类
     *
     * @param updateReqVO 更新信息
     */
    void updateProductCategory(@Valid CrmProductCategoryUpdateReqVO updateReqVO);

    /**
     * 删除产品分类
     *
     * @param id 编号
     */
    void deleteProductCategory(Long id);

    /**
     * 获得产品分类
     *
     * @param id 编号
     * @return 产品分类
     */
    CrmProductCategoryDO getProductCategory(Long id);

    /**
     * 获得产品分类列表
     *
     * @param ids 编号
     * @return 产品分类列表
     */
    List<CrmProductCategoryDO> getProductCategoryList(CrmProductCategoryListReqVO treeListReqVO);

}
