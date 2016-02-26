import Marionette from 'backbone.marionette';
import App from 'application';
import ArticleLayout from 'views/article/layout';
import ArticlesLayout from 'views/articles/layout';
import Article from 'models/article';
import Articles from 'collections/articles';

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
