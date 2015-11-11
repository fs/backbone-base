import ArticlesListView from 'scripts/views/articles/list';
import ArticlesFormView from 'scripts/views/articles/form';
import template from 'templates/layouts/articles_layout';
import { props } from 'scripts/decorators';

@props({
  template: template,

  ui: {
    articlesPaginationContainer: '.articles-pagination'
  },

  collectionEvents: {
    'add': 'onAddNewArticle'
  },

  regions: {
    articlesRegion: '#articles_list_region',
    writeArticleRegion: '#write_article_region'
  }
})
export default class ArticlesLayout extends Marionette.LayoutView {
  onRender() {
    this.initPagination(this.collection.pagination);
    this.articlesRegion.show(new ArticlesListView({ collection: this.collection }));
    this.writeArticleRegion.show(new ArticlesFormView({ collection: this.collection }));
  }

  onDestroy() {
    this.ui.articlesPaginationContainer.off();
  }

  onAddNewArticle() {
    this.writeArticleRegion.show(new ArticlesFormView({ collection: this.collection }));
  }

  initPagination(pagination) {
    this.ui.articlesPaginationContainer.bootpag({
      total: pagination.pagesTotal,
      page: pagination.page,
      maxVisible: 5,
    }).on('page', (event, pageNumber) => {
      this.collection.fetchPage(pageNumber);
    });
  }
}
