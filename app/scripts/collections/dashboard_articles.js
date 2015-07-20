import AppCollection from 'scripts/collections/app';
import DashboardArticle from 'scripts/models/dashboard_article';

export default class DashboardArticles extends AppCollection {
  constructor(...args) {
    this.url = 'dashboard';
    this.model = DashboardArticle;

    super(...args);
  }
}
