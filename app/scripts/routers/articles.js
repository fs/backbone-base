import App from 'scripts/application';
import BaseRouter from 'scripts/routers/base';
import routes from 'scripts/helpers/routes';
import { props } from 'scripts/decorators';

@props({
  navigation: 'articles',

  appRoutes: {
    'dashboard/articles/:page': 'index',
    'dashboard/articles/:page/article/:id': 'show'
  }
})
export default class ArticlesRouter extends BaseRouter {
  initialize() {
    this.listenTo(App.vent, 'page:change', this.changePage);
  }

  changePage(page) {
    this.navigate(routes.articlesIndexPath(page), { trigger: true });
  }
}
