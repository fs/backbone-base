import Backbone from 'backbone';
import App from 'application';
import BaseRouter from 'routers/base';
import Session from 'facades/session';
import Controller from 'controllers/navigation_controller';
import routes from 'helpers/routes';
import { props } from 'decorators';

@props({
  appRoutes: {
    'sign_out': 'signOut'
  }
})
export default class NavigationRouter extends BaseRouter {
  initialize() {
    this.controller = new Controller();
    this.listenTo(Session, 'create destroy', this.onSessionChange);
    this.listenTo(Backbone.history, 'route', this.onNavigationChange);
  }

  onSessionChange() {
    const path = (Session.isLoggedIn()) ? routes.dashboardIndexPath() : routes.rootPath();
    this.navigate(path, { trigger: true });
  }

  onNavigationChange(router) {
    App.vent.trigger('navigation:change', router.navigation);
  }
}
