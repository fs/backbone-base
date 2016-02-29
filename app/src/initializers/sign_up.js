import App from 'application';
import Router from 'routers/sign_up';
import routes from 'helpers/routes';

App.on('before:start', function() {
  const router = new Router();
  routes.bind('signup', router);
  console.log('module sign up started');
});
