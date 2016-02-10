import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import DashboardView from 'scripts/views/dashboard/dashboard';
import DashboardArticles from 'scripts/collections/dashboard_articles';

export default class DashboardController extends Marionette.Object {
  index() {
    const articles = new DashboardArticles();

    articles.fetch().then(() => {
      App.layout.mainRegion.show(new DashboardView({ collection: articles }));
    });
  }
}
