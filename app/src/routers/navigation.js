import Backbone from 'backbone';
import { mixin } from 'core-decorators';
import App from 'application';
import BaseRouter from 'routers/base';
import Session from 'services/session';
import Controller from 'controllers/navigation_controller';
import routes from 'helpers/routes';

@mixin({
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
