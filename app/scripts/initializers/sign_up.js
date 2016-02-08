import App from 'scripts/application';
import Router from 'scripts/routers/sign_up';
import Routes from 'scripts/helpers/routes';

App.on('before:start', function() {
  this.moduleName = 'signup';
  this.router = new Router();
  Routes.initModule(this);
  console.log('module sign up started');
});
