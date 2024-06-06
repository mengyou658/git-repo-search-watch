package cn.iocoder.yudao.module.infra.service.config;

import cn.hutool.core.util.BooleanUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.spring.SpringUtil;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.infra.controller.admin.config.vo.ConfigPageReqVO;
import cn.iocoder.yudao.module.infra.controller.admin.config.vo.ConfigSaveReqVO;
import cn.iocoder.yudao.module.infra.controller.admin.config.vo.ConfigSaveSimpleReqVO;
import cn.iocoder.yudao.module.infra.convert.config.ConfigConvert;
import cn.iocoder.yudao.module.infra.dal.dataobject.config.ConfigDO;
import cn.iocoder.yudao.module.infra.dal.mysql.config.ConfigMapper;
import cn.iocoder.yudao.module.infra.enums.config.ConfigTypeEnum;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.google.common.annotations.VisibleForTesting;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import java.math.BigDecimal;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.infra.enums.ErrorCodeConstants.CONFIG_CAN_NOT_DELETE_SYSTEM_TYPE;
import static cn.iocoder.yudao.module.infra.enums.ErrorCodeConstants.CONFIG_KEY_DUPLICATE;
import static cn.iocoder.yudao.module.infra.enums.ErrorCodeConstants.CONFIG_NOT_EXISTS;
import static cn.iocoder.yudao.module.system.dal.redis.RedisKeyConstants.IOT_CONFIG_KEY;

/**
 * 参数配置 Service 实现类
 */
@Service
@Slf4j
@Validated
public class ConfigServiceImpl implements ConfigService {

    @Resource
    private ConfigMapper configMapper;

    @Override
    @CacheEvict(cacheNames = IOT_CONFIG_KEY, allEntries = true)
    public Long saveConfig(ConfigSaveReqVO createReqVO) {
        // 校验参数配置 key 的唯一性
        validateConfigKeyUnique(null, createReqVO.getKey());

        // 插入参数配置
        ConfigDO config = ConfigConvert.INSTANCE.convert(createReqVO);
        config.setType(ConfigTypeEnum.CUSTOM.getType());
        configMapper.insert(config);
        return config.getId();
    }

    @Override
    @CacheEvict(cacheNames = IOT_CONFIG_KEY, allEntries = true)
    public void updateConfig(ConfigSaveReqVO updateReqVO) {
        // 校验自己存在
        validateConfigExists(updateReqVO.getId());
        // 校验参数配置 key 的唯一性
        validateConfigKeyUnique(updateReqVO.getId(), updateReqVO.getKey());

        // 更新参数配置
        ConfigDO updateObj = ConfigConvert.INSTANCE.convert(updateReqVO);
        configMapper.updateById(updateObj);
    }

    @Override
    @CacheEvict(cacheNames = IOT_CONFIG_KEY, allEntries = true)
    public void deleteConfig(Long id) {
        // 校验配置存在
        ConfigDO config = validateConfigExists(id);
        // 内置配置，不允许删除
        if (ConfigTypeEnum.SYSTEM.getType().equals(config.getType())) {
            throw exception(CONFIG_CAN_NOT_DELETE_SYSTEM_TYPE);
        }
        // 删除
        configMapper.deleteById(id);
    }

    @Override
    @Cacheable(cacheNames = IOT_CONFIG_KEY, key = "#p0")
    public ConfigDO getConfig(Long id) {
        return configMapper.selectById(id);
    }

    @Override
    @Cacheable(cacheNames = IOT_CONFIG_KEY, key = "#p0")
    public ConfigDO getConfigByKey(String key) {
        return configMapper.selectByKey(key);
    }

    @Override
    public PageResult<ConfigDO> getConfigPage(ConfigPageReqVO pageReqVO) {
        return configMapper.selectPage(pageReqVO);
    }


    public ConfigServiceImpl getSelf() {
        return SpringUtil.getBean(ConfigServiceImpl.class);
    }

    @Override
    @Cacheable(cacheNames = IOT_CONFIG_KEY, key = "#p0")
    public BigDecimal getConfigNumberByKey(String key, BigDecimal defaultVal) {
        ConfigDO val = getConfigByKey(key);
        if (null != val && StrUtil.isNotBlank(val.getValue()) && NumberUtil.isNumber(val.getValue())) {
            return new BigDecimal(val.getValue());
        }
        return defaultVal;
    }

    @Override
    @Cacheable(cacheNames = IOT_CONFIG_KEY, key = "#p0")
    public String getConfigStringByKey(String key, String defaultVal) {
        ConfigDO val = getConfigByKey(key);
        return null != val ? val.getValue() : null;
    }

    @Override
    public <T> T getConfigStringByKey(String key, T defaultVal) {
        ConfigDO val = getSelf().getConfigByKey(key);
        return null != val ? JSON.parseObject(val.getValue(), (Class<T>) defaultVal.getClass()) : defaultVal;
    }

    @Override
    public <T> T getConfigStringByKey(String key, TypeReference<T> type, T defaultVal) {
        ConfigDO val = getSelf().getConfigByKey(key);
        return null != val ? JSON.parseObject(val.getValue(), type) : defaultVal;
    }

    @Override
    @Cacheable(cacheNames = IOT_CONFIG_KEY, key = "#p0")
    public Boolean getConfigBooleanByKey(String key, boolean defaultVal) {
        ConfigDO val = getConfigByKey(key);
        if (null != val && StrUtil.isNotBlank(val.getValue()) && (StrUtil.equalsAny(val.getValue().trim(), "true", "false"))) {
            return BooleanUtil.toBoolean(val.getValue().trim());
        }
        return defaultVal;
    }

    @Override
    @CacheEvict(cacheNames = IOT_CONFIG_KEY, allEntries = true)
    public Long saveConfig(ConfigSaveSimpleReqVO createReqVO) {
        if (StrUtil.isNotBlank(createReqVO.getKey())) {
            ConfigDO config = getConfigByKey(createReqVO.getKey());
            if (null != config) {
                config.setValue(createReqVO.getValue());
                configMapper.updateById(config);
            } else {
                ConfigDO configDO = new ConfigDO();
                configDO.setCategory(createReqVO.getKey());
                configDO.setConfigKey(createReqVO.getKey());
                configDO.setName(createReqVO.getName());
                configDO.setType(ConfigTypeEnum.SYSTEM.getType());
                configDO.setValue(createReqVO.getValue());
                configDO.setVisible(true);
                configMapper.insert(configDO);
            }
        }
        return 0L;
    }

    @VisibleForTesting
    public ConfigDO validateConfigExists(Long id) {
        if (id == null) {
            return null;
        }
        ConfigDO config = configMapper.selectById(id);
        if (config == null) {
            throw exception(CONFIG_NOT_EXISTS);
        }
        return config;
    }

    @VisibleForTesting
    public void validateConfigKeyUnique(Long id, String key) {
        ConfigDO config = configMapper.selectByKey(key);
        if (config == null) {
            return;
        }
        // 如果 id 为空，说明不用比较是否为相同 id 的参数配置
        if (id == null) {
            throw exception(CONFIG_KEY_DUPLICATE);
        }
        if (!config.getId().equals(id)) {
            throw exception(CONFIG_KEY_DUPLICATE);
        }
    }

}
