import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import ArticleLayout from 'scripts/views/layouts/article_layout';
import ArticlesLayout from 'scripts/views/layouts/articles_layout';
import Article from 'scripts/models/article';
import Articles from 'scripts/collections/articles';

export default class ArticlesController extends Marionette.Object {
  index(page) {
    const articles = new Articles();

    articles.fetchByPage(page).then(() => {
      App.layout.mainRegion.show(new ArticlesLayout({
        page,
        collection: articles
      }));
    });
  }

  show(page, id) {
    const article = new Article({ id });

    article.fetch().then(() => {
      App.layout.mainRegion.show(new ArticleLayout({ model: article }));
    });
  }
}
