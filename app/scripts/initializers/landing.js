import App from 'application';
import Router from 'routers/landing';
import routes from 'helpers/routes';

App.on('before:start', function() {
  const router = new Router();
  routes.bind(router);
  console.log('module landing started');
});
