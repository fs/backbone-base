import AppCollection from 'scripts/collections/app';
import Article from 'scripts/models/article';
import { props } from 'scripts/decorators';

@props({
  url: 'articles',
  model: Article
})
export default class Articles extends AppCollection {}
