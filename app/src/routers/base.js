import 'backbone-route-filter/backbone-route-filter';
import Marionette from 'backbone.marionette';
import Session from 'facades/session';
import routes from 'helpers/routes';
import { props } from 'decorators';

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
