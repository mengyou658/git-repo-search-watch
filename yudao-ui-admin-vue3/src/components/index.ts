import type { App } from 'vue'
import { Icon } from './Icon'
import { Form } from '@/components/Form'
import { Table } from '@/components/Table'
import { Search } from '@/components/Search'
import { Dialog } from '@/components/Dialog'
import { DictTag } from '@/components/DictTag'
import { ContentWrap } from '@/components/ContentWrap'
import { Descriptions } from '@/components/Descriptions'

export const setupGlobCom = (app: App<Element>): void => {
  app.component('Icon', Icon)
  app.component('Form', Form)
  app.component('Table', Table)
  app.component('Search', Search)
  app.component('Dialog', Dialog)
  app.component('DictTag', DictTag)
  app.component('ContentWrap', ContentWrap)
  app.component('Descriptions', Descriptions)
}
