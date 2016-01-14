import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import Router from 'scripts/routers/sign_up';
import Controller from 'scripts/controllers/sign_up_controller';
import Routes from 'scripts/helpers/routes';
import { props } from 'scripts/decorators';

@props({
  startWithParent: true
})
class SignUp extends Marionette.Module {
  onBeforeStart() {
    const controller = new Controller();
    this.router = new Router({ controller });
    Routes.initModule(this);
  }

  onStart() {
    console.log('module sign up started');
  }
}

App.module('SignUp', SignUp);

export default SignUp;
