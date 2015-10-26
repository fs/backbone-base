import Articles from 'scripts/collections/articles';
import { props } from 'scripts/decorators';

@props({
  url: 'dashboard',
})
export default class DashboardArticles extends Articles {}
