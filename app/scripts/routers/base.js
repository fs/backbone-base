import 'backbone-route-filter/backbone-route-filter';
import Marionette from 'backbone.marionette';
import Session from 'scripts/facades/session';
import routes from 'scripts/helpers/routes';
import { props } from 'scripts/decorators';

@props({
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
