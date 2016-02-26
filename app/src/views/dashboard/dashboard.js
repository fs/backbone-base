import Marionette from 'backbone.marionette';
import Session from 'facades/session';
import DashboardItemView from 'views/dashboard/item';
import template from 'templates/dashboard/dashboard';
import { props } from 'decorators';

@props({
  template,
  className: 'jumbotron',
  childView: DashboardItemView,
  childViewContainer: '.articles-list',
  model: Session.currentUser()
})
export default class DashboardView extends Marionette.CompositeView {}
