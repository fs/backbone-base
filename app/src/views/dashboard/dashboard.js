import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import Session from 'services/session';
import DashboardItemView from 'views/dashboard/item';
import template from 'templates/dashboard/dashboard';

@mixin({
  template,
  className: 'jumbotron',
  childViewContainer: '.articles-list',
  childView: DashboardItemView,
  model: Session.currentUser()
})
export default class DashboardView extends Marionette.CompositeView {}
