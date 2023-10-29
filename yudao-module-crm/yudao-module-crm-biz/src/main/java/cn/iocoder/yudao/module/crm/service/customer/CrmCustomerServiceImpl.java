package cn.iocoder.yudao.module.crm.service.customer;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.ListUtil;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.crm.controller.admin.customer.vo.CrmCustomerCreateReqVO;
import cn.iocoder.yudao.module.crm.controller.admin.customer.vo.CrmCustomerExportReqVO;
import cn.iocoder.yudao.module.crm.controller.admin.customer.vo.CrmCustomerPageReqVO;
import cn.iocoder.yudao.module.crm.controller.admin.customer.vo.CrmCustomerUpdateReqVO;
import cn.iocoder.yudao.module.crm.convert.customer.CrmCustomerConvert;
import cn.iocoder.yudao.module.crm.dal.dataobject.customer.CrmCustomerDO;
import cn.iocoder.yudao.module.crm.dal.mysql.customer.CrmCustomerMapper;
import cn.iocoder.yudao.module.system.api.dept.DeptApi;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;
import java.util.Objects;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.crm.enums.ErrorCodeConstants.CUSTOMER_NOT_EXISTS;

/**
 * 客户 Service 实现类
 *
 * @author Wanwan
 */
@Service
@Validated
public class CrmCustomerServiceImpl implements CrmCustomerService {

    @Resource
    private CrmCustomerMapper customerMapper;
    @Resource
    private DeptApi deptApi; // TODO @wanwan：拼接数据，可以放到 controller；所以这里的引入，可以考虑放到 controller 哈；

    @Override
    public Long createCustomer(CrmCustomerCreateReqVO createReqVO) {
        // 插入
        CrmCustomerDO customer = CrmCustomerConvert.INSTANCE.convert(createReqVO);
        customerMapper.insert(customer);
        // 返回
        return customer.getId();
    }

    @Override
    public void updateCustomer(CrmCustomerUpdateReqVO updateReqVO) {
        // 校验存在
        validateCustomerExists(updateReqVO.getId());
        // TODO 芋艿：数据权限，校验是否可以操作

        // 更新
        CrmCustomerDO updateObj = CrmCustomerConvert.INSTANCE.convert(updateReqVO);
        customerMapper.updateById(updateObj);
    }

    @Override
    public void deleteCustomer(Long id) {
        // 校验存在
        validateCustomerExists(id);
        // TODO 芋艿：数据权限，校验是否可以操作

        // 删除
        customerMapper.deleteById(id);
    }

    private void validateCustomerExists(Long id) {
        if (customerMapper.selectById(id) == null) {
            throw exception(CUSTOMER_NOT_EXISTS);
        }
    }

    @Override
    public CrmCustomerDO getCustomer(Long id) {
        return customerMapper.selectById(id);
    }

    @Override
    public List<CrmCustomerDO> getCustomerList(Collection<Long> ids) {
        if (CollUtil.isEmpty(ids)) {
            return ListUtil.empty();
        }
        return customerMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<CrmCustomerDO> getCustomerPage(CrmCustomerPageReqVO pageReqVO) {
        // TODO 芋艿：数据权限，是否可以查询到；
        return customerMapper.selectPage(pageReqVO);
    }

    @Override
    public List<CrmCustomerDO> getCustomerList(CrmCustomerExportReqVO exportReqVO) {
        return customerMapper.selectList(exportReqVO);
    }

    // TODO wanwan：service 接口已经注释，实现类就不需要了。
    /**
     * 校验客户是否存在
     *
     * @param customerId 客户id
     * @return
     */
    @Override
    public CrmCustomerDO validateCustomer(Long customerId) {
        CrmCustomerDO customer = getCustomer(customerId);
        if (Objects.isNull(customer)) {
            throw exception(CUSTOMER_NOT_EXISTS);
        }
        return customer;
    }

}
