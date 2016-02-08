import App from 'scripts/application';
import Router from 'scripts/routers/landing';
import Routes from 'scripts/helpers/routes';

App.on('before:start', function() {
  this.moduleName = 'landing';
  this.router = new Router();
  Routes.initModule(this);
  console.log('module landing started');
});
