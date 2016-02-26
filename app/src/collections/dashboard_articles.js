import Article from 'models/article';
import AppCollection from 'collections/app';
import { props } from 'decorators';

@props({
  url: 'dashboard',
  model: Article
})
export default class DashboardArticles extends AppCollection {}
