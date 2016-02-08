import App from 'scripts/application';
import Router from 'scripts/routers/navigation';
import routes from 'scripts/helpers/routes';

App.on('before:start', function() {
  const router = new Router();
  routes.init(router);
  console.log('module navigation started');
});
