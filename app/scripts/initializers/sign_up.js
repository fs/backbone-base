import App from 'scripts/application';
import Router from 'scripts/routers/sign_up';
import routes from 'scripts/helpers/routes';

App.on('before:start', function() {
  const router = new Router();
  routes.bind(router);
  console.log('module sign up started');
});
