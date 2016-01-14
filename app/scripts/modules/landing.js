import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import Router from 'scripts/routers/landing';
import Controller from 'scripts/controllers/landing_controller';
import Routes from 'scripts/helpers/routes';
import { props } from 'scripts/decorators';

@props({
  startWithParent: true
})
class Landing extends Marionette.Module {
  onBeforeStart() {
    const controller = new Controller();
    this.router = new Router({ controller });
    Routes.initModule(this);
  }

  onStart() {
    console.log('module landing started');
  }
}

App.module('Landing', Landing);

export default Landing;
