import App from 'scripts/application';
import BaseRouter from 'scripts/routers/base';
import Controller from 'scripts/controllers/sign_up_controller';
import { props } from 'scripts/decorators';

@props({
  appRoutes: {
    'sign_up': 'index'
  },

  controller: new Controller()
})
export default class SignUpRouter extends BaseRouter {}
