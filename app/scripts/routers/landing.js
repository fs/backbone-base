import BaseRouter from 'scripts/routers/base';

export default class LandingRouter extends BaseRouter {
  constructor(...args) {
    this.appRoutes = {
      '': 'index'
    };

    super(...args);
  }
}
