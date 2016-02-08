import App from 'scripts/application';
import Router from 'scripts/routers/articles';
import Routes from 'scripts/helpers/routes';

App.on('before:start', function() {
  this.moduleName = 'articles';
  this.router = new Router();
  Routes.initModule(this);
  console.log('module articles started');
});
