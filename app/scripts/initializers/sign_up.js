import App from 'scripts/application';
import Router from 'scripts/routers/sign_up';
import Routes from 'scripts/helpers/routes';

App.addInitializer(function() {
  this.moduleName = 'sign up';
  this.router = new Router();
  Routes.initModule(this);
  console.log('module sign up started');
});
