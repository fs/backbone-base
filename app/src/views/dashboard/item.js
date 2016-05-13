import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import template from 'templates/dashboard/item';

@mixin({
  template,
  tagName: 'li',
  className: 'articles-item articles-item--inline'
})
export default class DashboardItemView extends Marionette.ItemView {}
