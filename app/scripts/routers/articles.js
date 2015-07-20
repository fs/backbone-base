import BaseRouter from 'scripts/routers/base';

export default class ArticlesRouter extends BaseRouter {
  constructor(...args) {
    this.navigation = 'articles';

    this.appRoutes = {
      'dashboard/articles': 'index',
      'dashboard/articles/:id': 'show'
    };

    super(...args);
  }
}
