import App from 'application';
import Router from 'routers/articles';
import routes from 'helpers/routes';

App.on('before:start', function() {
  const router = new Router();
  routes.bind('articles', router);
  console.log('module articles started');
});
