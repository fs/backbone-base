import App from 'application';
import { mixin } from 'core-decorators';
import BaseRouter from 'routers/base';
import Controller from 'controllers/sign_up_controller';

@mixin({
  appRoutes: {
    'sign_up': 'index'
  },

  controller: new Controller()
})
export default class SignUpRouter extends BaseRouter {}
