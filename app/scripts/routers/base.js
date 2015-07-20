import Session from 'scripts/facades/session';
import Routes from 'scripts/helpers/routes';

export default class BaseRouter extends Marionette.AppRouter {
  constructor(...args) {
    this.before = {
      'dashboard(/*path)': 'redirectIfNotLoggedIn'
    };

    super(...args);
  }

  redirectIfNotLoggedIn() {
    if (!Session.isLoggedIn()) {
      this.navigate(Routes.rootPath(), { trigger: true });
      return false;
    }
  }
}
