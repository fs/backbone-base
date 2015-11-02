import App from 'scripts/application';
import ArticleLayout from 'scripts/views/layouts/article_layout';
import ArticlesLayout from 'scripts/views/layouts/articles_layout';
import Article from 'scripts/models/article';
import Articles from 'scripts/collections/articles';

export default class ArticlesController extends Marionette.Controller {
  index() {
    let articles = new Articles();

    articles.fetch().then(() => {
      App.mainRegion.show(new ArticlesLayout({ collection: articles }));
    });
  }

  show(id) {
    let article = new Article({ id });

    article.fetch().then(() => {
      App.mainRegion.show(new ArticleLayout({ model: article }));
    });
  }
}
