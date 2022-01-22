package cn.iocoder.yudao.adminserver.modules.system.service.dict;

import cn.iocoder.yudao.coreservice.modules.system.dal.dataobject.dict.SysDictDataDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.dict.core.service.DictDataFrameworkService;
import cn.iocoder.yudao.adminserver.modules.system.controller.dict.vo.data.SysDictDataCreateReqVO;
import cn.iocoder.yudao.adminserver.modules.system.controller.dict.vo.data.SysDictDataExportReqVO;
import cn.iocoder.yudao.adminserver.modules.system.controller.dict.vo.data.SysDictDataPageReqVO;
import cn.iocoder.yudao.adminserver.modules.system.controller.dict.vo.data.SysDictDataUpdateReqVO;

import java.util.Collection;
import java.util.List;

/**
 * 字典数据 Service 接口
 *
 * @author ruoyi
 */
public interface SysDictDataService {

    /**
     * 创建字典数据
     *
     * @param reqVO 字典数据信息
     * @return 字典数据编号
     */
    Long createDictData(SysDictDataCreateReqVO reqVO);

    /**
     * 更新字典数据
     *
     * @param reqVO 字典数据信息
     */
    void updateDictData(SysDictDataUpdateReqVO reqVO);

    /**
     * 删除字典数据
     *
     * @param id 字典数据编号
     */
    void deleteDictData(Long id);

    /**
     * 获得字典数据列表
     *
     * @return 字典数据全列表
     */
    List<SysDictDataDO> getDictDatas();

    /**
     * 获得字典数据分页列表
     *
     * @param reqVO 分页请求
     * @return 字典数据分页列表
     */
    PageResult<SysDictDataDO> getDictDataPage(SysDictDataPageReqVO reqVO);

    /**
     * 获得字典数据列表
     *
     * @param reqVO 列表请求
     * @return 字典数据列表
     */
    List<SysDictDataDO> getDictDatas(SysDictDataExportReqVO reqVO);

    /**
     * 获得字典数据详情
     *
     * @param id 字典数据编号
     * @return 字典数据
     */
    SysDictDataDO getDictData(Long id);

    /**
     * 获得指定字典类型的数据数量
     *
     * @param dictType 字典类型
     * @return 数据数量
     */
    int countByDictType(String dictType);

    /**
     * 校验字典数据们是否有效。如下情况，视为无效：
     * 1. 字典数据不存在
     * 2. 字典数据被禁用
     *
     * @param dictType 字典类型
     * @param values 字典数据值的数组
     */
    void validDictDatas(String dictType, Collection<String> values);

}
