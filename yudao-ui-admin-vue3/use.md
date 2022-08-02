# 注意事项

- 项目路径请不要使用中文命名！！！会造成解析乱码！！！请使用全英文路径！！！全英文路径！！！全英文路径！！！
- node >=16 , pnpm >=7，非node16+ pnpm 7+ 安装问题不予解决、不适配
- 开发建议使用 [谷歌浏览器-开发者版](https://www.google.cn/intl/zh-CN/chrome/dev/) 不支持 IE\QQ 等浏览器
- 本框架使用 TypeScript ，简称ts，和java的类型差不多，为了简化没过多使用 type
- 本框架使用 Vue3.2 + setup语法糖，请自行学习相关内容
- [点击查看：为什么Vue3.2，什么是setup，Vite为什么第一次加载速度慢](https://www.baidu.com)
- idea 怎么开发？ 不知道。
- 启动方式详见[README.md](./README.md)

## 简单使用

- 目录结构与 vue2 版本基本保持一致
- 一个页面(以post为例)由4部分组成
  
```bash
/src/api/system/post/ [index.ts | types.ts] 
/src/views/system/post/ [index.vue | post.data.ts] 
```

- 其中api内index.ts 与 vue2 基本一致，只不过axios封装了get post put delete upload download 等方法，不用写method: 'get' 了
- api内types.ts，是接口中的类型声明，与java中vo等保持一致， java中long int => ts 中 number
- views中，index.vue 与 vue2 基本一致，本框架封装了Search Table Form Descriptions等组件，也可以按照vue2方式去写，参考menu
- post.data.ts 中主要是表单校验 rules 和表单 crudSchemas ，通过修改crudSchemas 就可以控制增删改查的字段、输入框还是下拉框等等
- 本框架集成了国际化，不需要可以自己想办法移除，后期不会提供删减版 使用方式

```bash
import { useI18n } from '@/hooks/web/useI18n'
const { t } = useI18n()
t('common.createTime')
对应翻译文档在 src/locales 
```
