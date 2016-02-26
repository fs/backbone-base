import App from 'application';
import Router from 'routers/dashboard';
import routes from 'helpers/routes';

App.on('before:start', function() {
  const router = new Router();
  routes.bind(router);
  console.log('module dashboard started');
});
