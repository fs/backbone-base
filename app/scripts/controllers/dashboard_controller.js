import App from 'scripts/application';
import DashboardView from 'scripts/views/dashboard/dashboard';
import DashboardArticles from 'scripts/collections/dashboard_articles';

export default class DashboardController extends Marionette.Controller {
  index() {
    let articles = new DashboardArticles();

    articles.fetch().then(() => {
      App.mainRegion.show(new DashboardView({ collection: articles }));
    });
  }
}
