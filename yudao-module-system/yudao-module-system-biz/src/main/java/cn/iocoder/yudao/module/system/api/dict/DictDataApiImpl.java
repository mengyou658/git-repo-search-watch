package cn.iocoder.yudao.module.system.api.dict;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.framework.dict.core.DictFrameworkUtils;
import cn.iocoder.yudao.framework.security.core.util.SecurityFrameworkUtils;
import cn.iocoder.yudao.module.system.api.dict.dto.DictDataRespDTO;
import cn.iocoder.yudao.module.system.controller.admin.dict.vo.data.DictDataSaveReqVO;
import cn.iocoder.yudao.module.system.dal.dataobject.dict.DictDataDO;
import cn.iocoder.yudao.module.system.dal.mysql.dict.DictDataMapper;
import cn.iocoder.yudao.module.system.service.dict.DictDataService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * 字典数据 API 实现类
 *
 * @author 芋道源码
 */
@Service
public class DictDataApiImpl implements DictDataApi {

    @Resource
    private DictDataService dictDataService;

    @Resource
    private DictDataMapper dictDataMapper;

    @Override
    public void validateDictDataList(String dictType, Collection<String> values) {
        dictDataService.validateDictDataList(dictType, values);
    }

    @Override
    public DictDataRespDTO getDictData(String dictType, String value) {
        DictDataDO dictData = dictDataService.getDictData(dictType, value);
        return BeanUtils.toBean(dictData, DictDataRespDTO.class);
    }

    @Override
    public DictDataRespDTO parseDictData(String dictType, String label) {
        DictDataDO dictData = dictDataService.parseDictData(dictType, label);
        return BeanUtils.toBean(dictData, DictDataRespDTO.class);
    }

    @Override
    public List<DictDataRespDTO> getDictDataList(String dictType) {
        List<DictDataDO> list = dictDataService.getDictDataListByDictType(dictType);
        return BeanUtils.toBean(list, DictDataRespDTO.class);
    }

    @Override
    public void createDictData(String dictType, String values) {
        String loginUserId = SecurityFrameworkUtils.getLoginUserId() + "";
        if (StrUtil.isNotBlank(dictType) && StrUtil.isNotBlank(values)) {
            List<String> dictValues = StrUtil.split(values, ",");
            List<DictDataDO> dictDataListByDictType = dictDataService.getDictDataListByDictType(dictType);
            List<String> dictValueList = new ArrayList<>();
            if (CollUtil.isNotEmpty(dictDataListByDictType)) {
                dictValueList = dictDataListByDictType.stream().filter(it->it.getCreator().equals(loginUserId))
                        .map(DictDataDO::getValue).toList();
            }
            List<String> finalDictValueList = dictValueList;
            dictValues.removeIf(finalDictValueList::contains);
            for (String dictValue : dictValues) {
                DictDataDO dictDataSaveReqVO = new DictDataDO();
                dictDataSaveReqVO.setSort(0);
                dictDataSaveReqVO.setLabel(dictValue);
                dictDataSaveReqVO.setValue(dictValue);
                dictDataSaveReqVO.setDictType(dictType);
                dictDataSaveReqVO.setStatus(0);
                dictDataSaveReqVO.setColorType("default");
                dictDataSaveReqVO.setCssClass("");
                dictDataSaveReqVO.setRemark("");
                dictDataMapper.insert(dictDataSaveReqVO);
            }
        }
    }

}
