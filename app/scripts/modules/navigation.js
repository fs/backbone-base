import App from 'scripts/application';
import Router from 'scripts/routers/navigation';
import Controller from 'scripts/controllers/navigation_controller';
import Routes from 'scripts/helpers/routes';
import { props } from 'scripts/decorators';

@props({
  startWithParent: true
})
class Navigation extends Marionette.Module {
  onBeforeStart() {
    let controller = new Controller();
    this.router = new Router({ controller });
    Routes.initModule(this);
  }

  onStart() {
    console.log('module navigation started');
  }
}

App.module('Navigation', Navigation);

export default Navigation;
