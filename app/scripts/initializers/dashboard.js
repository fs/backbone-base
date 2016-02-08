import App from 'scripts/application';
import Router from 'scripts/routers/dashboard';
import Routes from 'scripts/helpers/routes';

App.addInitializer(function() {
  this.moduleName = 'dashboard';
  this.router = new Router();
  Routes.initModule(this);
  console.log('module dashboard started');
});
