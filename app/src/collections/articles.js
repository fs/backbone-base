import { mixin } from 'core-decorators';
import Article from 'models/article';
import PaginatedCollection from 'collections/paginated';

@mixin({
  url: 'articles',
  model: Article
})
export default class Articles extends PaginatedCollection {}
