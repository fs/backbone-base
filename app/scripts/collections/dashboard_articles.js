import Article from 'scripts/models/article';
import AppCollection from 'scripts/collections/app';
import { props } from 'scripts/decorators';

@props({
  url: 'dashboard',
  model: Article
})
export default class DashboardArticles extends AppCollection {}
