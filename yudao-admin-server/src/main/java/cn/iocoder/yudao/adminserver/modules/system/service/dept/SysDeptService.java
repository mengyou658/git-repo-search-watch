package cn.iocoder.yudao.adminserver.modules.system.service.dept;

import cn.hutool.core.collection.CollUtil;
import cn.iocoder.yudao.adminserver.modules.system.controller.dept.vo.dept.SysDeptCreateReqVO;
import cn.iocoder.yudao.adminserver.modules.system.controller.dept.vo.dept.SysDeptListReqVO;
import cn.iocoder.yudao.adminserver.modules.system.controller.dept.vo.dept.SysDeptUpdateReqVO;
import cn.iocoder.yudao.coreservice.modules.system.dal.dataobject.dept.SysDeptDO;
import cn.iocoder.yudao.framework.common.util.collection.CollectionUtils;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 部门 Service 接口
 *
 * @author 芋道源码
 */
public interface SysDeptService {

    /**
     * 初始化部门的本地缓存
     */
    void initLocalCache();

    /**
     * 创建部门
     *
     * @param reqVO 部门信息
     * @return 部门编号
     */
    Long createDept(SysDeptCreateReqVO reqVO);

    /**
     * 更新部门
     *
     * @param reqVO 部门信息
     */
    void updateDept(SysDeptUpdateReqVO reqVO);

    /**
     * 删除部门
     *
     * @param id 部门编号
     */
    void deleteDept(Long id);


    /**
     * 筛选部门列表
     *
     * @param reqVO 筛选条件请求 VO
     * @return 部门列表
     */
    List<SysDeptDO> getSimpleDepts(SysDeptListReqVO reqVO);

    /**
     * 获得所有子部门，从缓存中
     *
     * @param parentId 部门编号
     * @param recursive 是否递归获取所有
     * @return 子部门列表
     */
    List<SysDeptDO> getDeptsByParentIdFromCache(Long parentId, boolean recursive);

}
