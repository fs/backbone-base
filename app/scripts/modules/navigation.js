import App from 'scripts/application';
import Router from 'scripts/routers/navigation';
import Controller from 'scripts/controllers/navigation_controller';
import Routes from 'scripts/helpers/routes';

class Navigation extends Marionette.Module {
  constructor(...args) {
    this.startWithParent = true;

    super(...args);
  }

  onBeforeStart() {
    let controller = new Controller();
    this.router = new Router({controller: controller});
    Routes.initModule(this);
  }

  onStart() {
    console.log('module navigation started');
  }
}

App.module('Navigation', Navigation);

export default Navigation;
