import Session from 'scripts/facades/session';
import DashboardItemView from 'scripts/views/dashboard/item';
import template from 'templates/dashboard/dashboard';

export default class DashboardView extends Marionette.CompositeView {
  constructor(...args) {
    this.className = 'jumbotron';
    this.template = template;
    this.childView = DashboardItemView;
    this.childViewContainer = '.articles-list';
    this.model = Session.currentUser();

    super(...args);
  }
}
