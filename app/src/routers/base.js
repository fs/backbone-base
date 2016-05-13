import 'backbone-route-filter/backbone-route-filter';
import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import Session from 'services/session';
import routes from 'helpers/routes';

@mixin({
  before: {
    'dashboard(/*path)': 'redirectIfNotLoggedIn'
  }
})
export default class BaseRouter extends Marionette.AppRouter {
  redirectIfNotLoggedIn() {
    if (!Session.isLoggedIn()) {
      this.navigate(routes.rootPath(), { trigger: true });
      return false;
    }
  }
}
