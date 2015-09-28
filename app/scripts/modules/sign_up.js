import App from 'scripts/application';
import Router from 'scripts/routers/sign_up';
import Controller from 'scripts/controllers/sign_up_controller';
import Routes from 'scripts/helpers/routes';

class SignUp extends Marionette.Module {
  constructor(...args) {
    this.startWithParent = true;

    super(...args);
  }

  onBeforeStart() {
    let controller = new Controller();
    this.router = new Router({ controller });
    Routes.initModule(this);
  }

  onStart() {
    console.log('module sign up started');
  }
}

App.module('SignUp', SignUp);

export default SignUp;
