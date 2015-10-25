import Session from 'scripts/facades/session';
import Routes from 'scripts/helpers/routes';
import { props } from 'scripts/decorators';

@props({
  before: {
    'dashboard(/*path)': 'redirectIfNotLoggedIn'
  }
})
export default class BaseRouter extends Marionette.AppRouter {
  redirectIfNotLoggedIn() {
    if (!Session.isLoggedIn()) {
      this.navigate(Routes.rootPath(), { trigger: true });
      return false;
    }
  }
}
