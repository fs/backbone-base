import BaseRouter from 'scripts/routers/base';

export default class DashboardRouter extends BaseRouter {
  constructor(...args) {
    this.navigation = 'dashboard';

    this.appRoutes = {
      'dashboard': 'index'
    };

    super(...args);
  }
}
