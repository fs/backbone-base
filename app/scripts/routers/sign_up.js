import BaseRouter from 'scripts/routers/base';

export default class SignUpRouter extends BaseRouter {
  constructor(...args) {
    this.appRoutes = {
      'sign_up': 'index',
    };

    super(...args);
  }
}
