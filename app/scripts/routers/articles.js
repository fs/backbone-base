import App from 'scripts/application';
import BaseRouter from 'scripts/routers/base';
import Controller from 'scripts/controllers/articles_controller';
import routes from 'scripts/helpers/routes';
import { props } from 'scripts/decorators';

@props({
  navigation: 'articles',

  appRoutes: {
    'dashboard/articles/:page': 'index',
    'dashboard/articles/:page/article/:id': 'show'
  },

  controller: new Controller()
})
export default class ArticlesRouter extends BaseRouter {
  initialize() {
    this.listenTo(App.vent, 'page:change', this.changePage);
  }

  changePage(page) {
    this.navigate(routes.articlesIndexPath(page), { trigger: true });
  }
}
