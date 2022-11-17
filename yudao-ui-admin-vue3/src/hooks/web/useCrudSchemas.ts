import { reactive } from 'vue'
import { eachTree, treeMap, filter } from '@/utils/tree'
import { getBoolDictOptions, getDictOptions, getIntDictOptions } from '@/utils/dict'
import { FormSchema } from '@/types/form'
import { TableColumn } from '@/types/table'
import { DescriptionsSchema } from '@/types/descriptions'
import { ComponentOptions } from '@/types/components'

export type CrudSchema = Omit<TableColumn, 'children'> & {
  isSearch?: boolean // 是否在查询显示
  search?: CrudSearchParams // 查询的详细配置
  isTable?: boolean // 是否在列表显示
  table?: CrudTableParams // 列表的详细配置
  isForm?: boolean // 是否在表单显示
  form?: CrudFormParams // 表单的详细配置
  isDetail?: boolean // 是否在详情显示
  detail?: CrudDescriptionsParams // 详情的详细配置
  children?: CrudSchema[]
  dictType?: string // 字典类型
  dictData?: 'string' | 'number' | 'boolean' // 字典数据类型 string | number | boolean
}

type CrudSearchParams = {
  // 是否显示在查询项
  show?: boolean
} & Omit<FormSchema, 'field'>

type CrudTableParams = {
  // 是否显示表头
  show?: boolean
} & Omit<FormSchema, 'field'>

type CrudFormParams = {
  // 是否显示表单项
  show?: boolean
} & Omit<FormSchema, 'field'>

type CrudDescriptionsParams = {
  // 是否显示表单项
  show?: boolean
} & Omit<DescriptionsSchema, 'field'>

interface AllSchemas {
  searchSchema: FormSchema[]
  tableColumns: TableColumn[]
  formSchema: FormSchema[]
  detailSchema: DescriptionsSchema[]
}

// 过滤所有结构
export const useCrudSchemas = (
  crudSchema: CrudSchema[]
): {
  allSchemas: AllSchemas
} => {
  // 所有结构数据
  const allSchemas = reactive<AllSchemas>({
    searchSchema: [],
    tableColumns: [],
    formSchema: [],
    detailSchema: []
  })

  const searchSchema = filterSearchSchema(crudSchema)
  allSchemas.searchSchema = searchSchema || []

  const tableColumns = filterTableSchema(crudSchema)
  allSchemas.tableColumns = tableColumns || []

  const formSchema = filterFormSchema(crudSchema)
  allSchemas.formSchema = formSchema

  const detailSchema = filterDescriptionsSchema(crudSchema)
  allSchemas.detailSchema = detailSchema

  return {
    allSchemas
  }
}

// 过滤 Search 结构
const filterSearchSchema = (crudSchema: CrudSchema[]): FormSchema[] => {
  const searchSchema: FormSchema[] = []

  eachTree(crudSchema, (schemaItem: CrudSchema) => {
    // 判断是否显示
    if (schemaItem?.isSearch || schemaItem.search?.show) {
      let component = schemaItem?.search?.component || 'Input'
      const options: ComponentOptions[] = []
      let comonentProps = {}
      if (schemaItem.dictType) {
        const allOptions: ComponentOptions = { label: '全部', value: '' }
        options.push(allOptions)
        getDictOptions(schemaItem.dictType).forEach((dict) => {
          options.push(dict)
        })
        comonentProps = {
          options: options
        }
        if (!schemaItem.search?.component) component = 'Select'
      }
      const searchSchemaItem = {
        // 默认为 input
        component: component,
        componentProps: comonentProps,
        ...schemaItem.search,
        field: schemaItem.field,
        label: schemaItem.search?.label || schemaItem.label
      }
      // 删除不必要的字段
      delete searchSchemaItem.show

      searchSchema.push(searchSchemaItem)
    }
  })
  return searchSchema
}

// 过滤 table 结构
const filterTableSchema = (crudSchema: CrudSchema[]): TableColumn[] => {
  const tableColumns = treeMap<CrudSchema>(crudSchema, {
    conversion: (schema: CrudSchema) => {
      if (schema?.isTable !== false || schema?.table?.show !== false) {
        return {
          ...schema.table,
          ...schema
        }
      }
    }
  })

  // 第一次过滤会有 undefined 所以需要二次过滤
  return filter<TableColumn>(tableColumns as TableColumn[], (data) => {
    if (data.children === void 0) {
      delete data.children
    }
    return !!data.field
  })
}

// 过滤 form 结构
const filterFormSchema = (crudSchema: CrudSchema[]): FormSchema[] => {
  const formSchema: FormSchema[] = []

  eachTree(crudSchema, (schemaItem: CrudSchema) => {
    // 判断是否显示
    if (schemaItem?.isForm !== false || schemaItem?.form?.show == true) {
      let component = schemaItem?.form?.component || 'Input'
      let defaultValue: any = ''
      if (schemaItem.form?.value) {
        defaultValue = schemaItem.form?.value
      } else {
        if (component === 'InputNumber') {
          defaultValue = 0
        }
      }
      let comonentProps = {}
      if (schemaItem.dictType) {
        const options: ComponentOptions[] = []
        if (schemaItem.dictData && schemaItem.dictData === 'number') {
          getIntDictOptions(schemaItem.dictType).forEach((dict) => {
            options.push(dict)
          })
        } else if (schemaItem.dictData && schemaItem.dictData === 'boolean') {
          getBoolDictOptions(schemaItem.dictType).forEach((dict) => {
            options.push(dict)
          })
        } else {
          getDictOptions(schemaItem.dictType).forEach((dict) => {
            options.push(dict)
          })
        }
        comonentProps = {
          options: options
        }
        if (!(schemaItem.form && schemaItem.form.component)) component = 'Select'
      }
      const formSchemaItem = {
        // 默认为 input
        component: component,
        componentProps: comonentProps,
        value: defaultValue,
        ...schemaItem.form,
        field: schemaItem.field,
        label: schemaItem.form?.label || schemaItem.label
      }

      // 删除不必要的字段
      delete formSchemaItem.show

      formSchema.push(formSchemaItem)
    }
  })

  return formSchema
}

// 过滤 descriptions 结构
const filterDescriptionsSchema = (crudSchema: CrudSchema[]): DescriptionsSchema[] => {
  const descriptionsSchema: FormSchema[] = []

  eachTree(crudSchema, (schemaItem: CrudSchema) => {
    // 判断是否显示
    if (schemaItem?.isDetail !== false || schemaItem.detail?.show !== false) {
      const descriptionsSchemaItem = {
        ...schemaItem.detail,
        field: schemaItem.field,
        label: schemaItem.detail?.label || schemaItem.label
      }
      if (schemaItem.dictType) {
        descriptionsSchemaItem.dictType = schemaItem.dictType
      }
      if (schemaItem.detail?.dateFormat || schemaItem.formatter == 'formatDate') {
        descriptionsSchemaItem.dateFormat = schemaItem.dateFormat
          ? schemaItem?.detail?.dateFormat
          : 'YYYY-MM-DD HH:mm:ss'
      }

      // 删除不必要的字段
      delete descriptionsSchemaItem.show

      descriptionsSchema.push(descriptionsSchemaItem)
    }
  })

  return descriptionsSchema
}
