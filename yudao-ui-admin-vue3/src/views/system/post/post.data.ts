import { reactive } from 'vue'
import { useI18n } from '@/hooks/web/useI18n'
import { required } from '@/utils/formRules'
import { DICT_TYPE } from '@/utils/dict'
import { VxeCrudSchema, useVxeCrudSchemas } from '@/hooks/web/useVxeCrudSchemas'
const { t } = useI18n() // 国际化

// 表单校验
export const rules = reactive({
  name: [required],
  code: [required],
  sort: [required]
})

// CrudSchema
const crudSchemas = reactive<VxeCrudSchema>({
  primaryKey: 'id',
  primaryType: 'seq',
  action: true,
  columns: [
    {
      title: '岗位名称',
      field: 'name',
      search: {
        show: true
      }
    },
    {
      title: '岗位编码',
      field: 'code',
      search: {
        show: true
      }
    },
    {
      title: '岗位顺序',
      field: 'sort'
    },
    {
      title: t('common.status'),
      field: 'status',
      dictType: DICT_TYPE.COMMON_STATUS,
      search: {
        show: true
      }
    },
    {
      title: '备注',
      field: 'remark',
      table: {
        show: false
      }
    },
    {
      title: t('common.createTime'),
      field: 'createTime',
      formatter: 'formatDate',
      form: {
        show: false
      }
    }
  ]
})
export const { allSchemas } = useVxeCrudSchemas(crudSchemas)
