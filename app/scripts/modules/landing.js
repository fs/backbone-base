import App from 'scripts/application';
import Router from 'scripts/routers/landing';
import Controller from 'scripts/controllers/landing_controller';
import Routes from 'scripts/helpers/routes';

class Landing extends Marionette.Module {
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
    console.log('module landing started');
  }
}

App.module('Landing', Landing);

export default Landing;
