package cn.iocoder.yudao.module.crm.service.customer;

import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.crm.controller.admin.customer.vo.poolconfig.CrmCustomerPoolConfigSaveReqVO;
import cn.iocoder.yudao.module.crm.convert.customer.CrmCustomerConvert;
import cn.iocoder.yudao.module.crm.dal.dataobject.customer.CrmCustomerPoolConfigDO;
import cn.iocoder.yudao.module.crm.dal.mysql.customer.CrmCustomerPoolConfigMapper;
import com.mzt.logapi.context.LogRecordContext;
import com.mzt.logapi.starter.annotation.LogRecord;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import java.util.Objects;

import static cn.iocoder.yudao.module.crm.enums.LogRecordConstants.*;

/**
 * 客户公海配置 Service 实现类
 *
 * @author Wanwan
 */
@Service
@Validated
public class CrmCustomerPoolConfigServiceImpl implements CrmCustomerPoolConfigService {

    @Resource
    private CrmCustomerPoolConfigMapper customerPoolConfigMapper;

    /**
     * 获得客户公海配置
     *
     * @return 客户公海配置
     */
    @Override
    public CrmCustomerPoolConfigDO getCustomerPoolConfig() {
        return customerPoolConfigMapper.selectOne(new LambdaQueryWrapperX<CrmCustomerPoolConfigDO>().last("LIMIT 1"));
    }

    /**
     * 保存客户公海配置
     *
     * @param saveReqVO 更新信息
     */
    @Override
    @LogRecord(type = CRM_CUSTOMER_POOL_CONFIG_TYPE, subType = CRM_CUSTOMER_POOL_CONFIG_SUB_TYPE, bizNo = "{{#poolConfigId}}", success = CRM_CUSTOMER_POOL_CONFIG_SUCCESS)
    public void saveCustomerPoolConfig(CrmCustomerPoolConfigSaveReqVO saveReqVO) {
        // 存在，则进行更新
        CrmCustomerPoolConfigDO dbConfig = getCustomerPoolConfig();
        CrmCustomerPoolConfigDO poolConfig = CrmCustomerConvert.INSTANCE.convert(saveReqVO);
        if (Objects.nonNull(dbConfig)) {
            customerPoolConfigMapper.updateById(poolConfig.setId(dbConfig.getId()));
            // 记录操作日志上下文
            LogRecordContext.putVariable("isPoolConfigUpdate", Boolean.TRUE);
            LogRecordContext.putVariable("poolConfigId", poolConfig.getId());
            return;
        }
        // 不存在，则进行插入
        customerPoolConfigMapper.insert(poolConfig);
        // 记录操作日志上下文
        LogRecordContext.putVariable("isPoolConfigUpdate", Boolean.FALSE);
        LogRecordContext.putVariable("poolConfigId", poolConfig.getId());
    }

}
