import ArticlesListView from 'scripts/views/articles/list';
import ArticlesFormView from 'scripts/views/articles/form';
import template from 'templates/layouts/articles_layout';

export default class ArticlesLayout extends Marionette.LayoutView {
  constructor(...args) {
    this.template = template;

    this.collectionEvents = {
      'add': 'onAddNewArticle'
    };

    this.regions = {
      articlesRegion: '#articles_list_region',
      writeArticleRegion: '#write_article_region'
    };

    super(...args);
  }

  onRender() {
    this.articlesRegion.show(new ArticlesListView({ collection: this.collection }));
    this.writeArticleRegion.show(new ArticlesFormView({ collection: this.collection }));
  }

  onAddNewArticle() {
    this.writeArticleRegion.show(new ArticlesFormView({ collection: this.collection }));
  }
}
