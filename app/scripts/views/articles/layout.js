import Marionette from 'backbone.marionette';
import PaginationBehavior from 'scripts/behaviors/pagination';
import ArticlesListView from 'scripts/views/articles/list';
import ArticlesFormView from 'scripts/views/articles/form';
import template from 'templates/articles/layout';
import { props } from 'scripts/decorators';

@props({
  template,

  collectionEvents: {
    'add': 'onAddNewArticle'
  },

  behaviors: {
    pagination: {
      behaviorClass: PaginationBehavior,
      maximumOfVisiblePages: 5
    }
  },

  regions: {
    articlesRegion: '#articles_list_region',
    writeArticleRegion: '#write_article_region'
  }
})
export default class ArticlesLayout extends Marionette.LayoutView {
  onRender() {
    this.articlesRegion.show(new ArticlesListView({
      collection: this.collection,
      page: this.options.page
    }));
    this.writeArticleRegion.show(new ArticlesFormView({ collection: this.collection }));
  }

  onAddNewArticle() {
    this.writeArticleRegion.show(new ArticlesFormView({ collection: this.collection }));
  }
}
