import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import Router from 'scripts/routers/navigation';
import Routes from 'scripts/helpers/routes';
import { props } from 'scripts/decorators';

@props({
  startWithParent: true
})
class Navigation extends Marionette.Module {
  onBeforeStart() {
    this.router = new Router();
    Routes.initModule(this);
  }

  onStart() {
    console.log('module navigation started');
  }
}

App.module('Navigation', Navigation);

export default Navigation;
