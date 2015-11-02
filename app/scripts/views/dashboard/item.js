import template from 'templates/dashboard/item';
import { props } from 'scripts/decorators';

@props({
  tagName: 'li',
  className: 'item',
  template: template
})
export default class DashboardItemView extends Marionette.ItemView {}
