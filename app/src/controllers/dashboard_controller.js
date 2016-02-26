import Marionette from 'backbone.marionette';
import App from 'application';
import DashboardView from 'views/dashboard/dashboard';
import DashboardArticles from 'collections/dashboard_articles';

export default class DashboardController extends Marionette.Object {
  index() {
    const articles = new DashboardArticles();

    articles.fetch().then(() => {
      App.layout.mainRegion.show(new DashboardView({ collection: articles }));
    });
  }
}
