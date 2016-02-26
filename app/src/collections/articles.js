import Article from 'models/article';
import PaginatedCollection from 'collections/paginated';
import { props } from 'decorators';

@props({
  url: 'articles',
  model: Article
})
export default class Articles extends PaginatedCollection {}
