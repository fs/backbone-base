import BaseRouter from 'scripts/routers/base';
import { props } from 'scripts/decorators';

@props({
  navigation: 'articles',

  appRoutes: {
    'dashboard/articles': 'index',
    'dashboard/articles/:id': 'show'
  }
})
export default class ArticlesRouter extends BaseRouter {}
