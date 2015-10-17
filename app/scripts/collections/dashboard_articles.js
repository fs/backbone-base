import AppCollection from 'scripts/collections/app';
import Article from 'scripts/models/article';

export default class DashboardArticles extends AppCollection {
  constructor(...args) {
    this.url = 'dashboard';
    this.model = Article;

    super(...args);
  }
}
