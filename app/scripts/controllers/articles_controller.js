import App from 'scripts/application';
import ArticlesLayout from 'scripts/views/layouts/articles_layout';
import ArticlesShowView from 'scripts/views/articles/show';
import Article from 'scripts/models/article';
import Articles from 'scripts/collections/articles';

export default class ArticlesController extends Marionette.Controller {
  index() {
    let articles = new Articles();

    articles.fetch().then(function() {
      App.mainRegion.show(new ArticlesLayout({ collection: articles }));
    });
  }

  show(id) {
    let article = new Article({ id: id });

    article.fetch().then(function() {
      App.mainRegion.show(new ArticlesShowView({ model: article }));
    });
  }
}
