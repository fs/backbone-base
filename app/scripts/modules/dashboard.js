import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import Router from 'scripts/routers/dashboard';
import Controller from 'scripts/controllers/dashboard_controller';
import Routes from 'scripts/helpers/routes';
import { props } from 'scripts/decorators';

@props({
  startWithParent: true
})
class Dashboard extends Marionette.Module {
  onBeforeStart() {
    let controller = new Controller();
    this.router = new Router({ controller });
    Routes.initModule(this);
  }

  onStart() {
    console.log('module dashboard started');
  }
}

App.module('Dashboard', Dashboard);

export default Dashboard;
