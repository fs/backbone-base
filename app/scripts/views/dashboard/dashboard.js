import Session from 'scripts/facades/session';
import DashboardItemView from 'scripts/views/dashboard/item';
import template from 'templates/dashboard/dashboard';
import { props } from 'scripts/decorators';

@props({
  className: 'jumbotron',
  template: template,
  childView: DashboardItemView,
  childViewContainer: '.articles-list',
  model: Session.currentUser()
})
export default class DashboardView extends Marionette.CompositeView {}
