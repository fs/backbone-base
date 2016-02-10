import App from 'scripts/application';
import Router from 'scripts/routers/landing';
import routes from 'scripts/helpers/routes';

App.on('before:start', function() {
  const router = new Router();
  routes.init(router);
  console.log('module landing started');
});
