import App from 'scripts/application';
import BaseRouter from 'scripts/routers/base';
import routes from 'scripts/helpers/routes';

export default class SignUpRouter extends BaseRouter {
  constructor(...args) {
    this.appRoutes = {
      'sign_up': 'index',
    };

    super(...args);
  }
}
