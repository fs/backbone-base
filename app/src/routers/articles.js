import { mixin } from 'core-decorators';
import App from 'application';
import BaseRouter from 'routers/base';
import Controller from 'controllers/articles_controller';
import routes from 'helpers/routes';

@mixin({
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
