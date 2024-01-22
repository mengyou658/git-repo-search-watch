package cn.iocoder.yudao.module.crm.service.business;

import cn.iocoder.yudao.module.crm.dal.dataobject.business.CrmBusinessProductDO;

import java.util.List;

/**
 * 商机产品关联表 Service 接口
 *
 * @author lzxhqs
 */
public interface CrmBusinessProductService {

    /**
     * 批量新增商机产品关联数据
     * @param list 商机产品集合
     */
    void insertBatch(List<CrmBusinessProductDO> list);

    /**
     * 根据商机id获取商机产品关联数据集合
     * @param businessId 商机id
     */
    List<CrmBusinessProductDO> selectListByBusinessId(Long businessId);

    /**
     * 批量更新商机产品表
     * @param list 商机产品数据集合
     */
    void updateBatch(List<CrmBusinessProductDO> list);

    /**
     * 批量删除
     * @param list 需要删除的商机产品集合
     */
    void deleteBatch(List<CrmBusinessProductDO> list);

    /**
     *根据商机id删除商机产品关联数据
     * @param businessId 商机id
     */
    void deleteByBusinessId(Long businessId);
}
