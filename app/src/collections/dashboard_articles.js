import { mixin } from 'core-decorators';
import Article from 'models/article';
import AppCollection from 'collections/app';

@mixin({
  url: 'dashboard',
  model: Article
})
export default class DashboardArticles extends AppCollection {}
