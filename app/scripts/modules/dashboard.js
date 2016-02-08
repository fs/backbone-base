import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import Router from 'scripts/routers/dashboard';
import Routes from 'scripts/helpers/routes';
import { props } from 'scripts/decorators';

@props({
  startWithParent: true
})
class Dashboard extends Marionette.Module {
  onBeforeStart() {
    this.router = new Router();
    Routes.initModule(this);
  }

  onStart() {
    console.log('module dashboard started');
  }
}

App.module('Dashboard', Dashboard);

export default Dashboard;
