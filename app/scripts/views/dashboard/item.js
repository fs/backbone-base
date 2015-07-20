import template from 'templates/dashboard/item';

export default class DashboardItemView extends Marionette.ItemView {
  constructor(...args) {
    this.tagName = 'li';
    this.className = 'item';
    this.template = template;

    super(...args);
  }
}
