import App from 'application';
import BaseRouter from 'routers/base';
import Controller from 'controllers/sign_up_controller';
import { props } from 'decorators';

@props({
  appRoutes: {
    'sign_up': 'index'
  },

  controller: new Controller()
})
export default class SignUpRouter extends BaseRouter {}
