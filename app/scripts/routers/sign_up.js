import App from 'scripts/application';
import BaseRouter from 'scripts/routers/base';
import { props } from 'scripts/decorators';

@props({
  appRoutes: {
    'sign_up': 'index'
  }
})
export default class SignUpRouter extends BaseRouter {}
