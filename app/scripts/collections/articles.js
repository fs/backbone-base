import Article from 'scripts/models/article';
import PaginatedCollection from 'scripts/collections/paginated';
import { props } from 'scripts/decorators';

@props({
  url: 'articles',
  model: Article
})
export default class Articles extends PaginatedCollection {}
