import App from 'scripts/application';
import Router from 'scripts/routers/dashboard';
import Controller from 'scripts/controllers/dashboard_controller';
import Routes from 'scripts/helpers/routes';

class Dashboard extends Marionette.Module {
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
    console.log('module dashboard started');
  }
}

App.module('Dashboard', Dashboard);

export default Dashboard
