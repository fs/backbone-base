import Marionette from 'backbone.marionette';
import template from 'templates/dashboard/item';
import { props } from 'decorators';

@props({
  template,
  tagName: 'li',
  className: 'item'
})
export default class DashboardItemView extends Marionette.ItemView {}
