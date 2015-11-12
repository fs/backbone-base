import { props } from 'scripts/decorators';

@props({
  ui: {
    articlesPaginationContainer: '.articles-pagination'
  },

  defaults: {
    maximumOfVisiblePages: 10
  }
})
export default class FormBehavior extends Marionette.Behavior {
  onRender() {
    this.initPagination(this.view.collection.pagination);
  }

  onDestroy() {
    this.ui.articlesPaginationContainer.off();
  }

  initPagination(pagination) {
    this.ui.articlesPaginationContainer.bootpag({
      total: pagination.pagesTotal,
      page: pagination.page,
      maxVisible: this.options.maximumOfVisiblePages,
    }).on('page', (event, pageNumber) => {
      this.view.collection.fetchByPage(pageNumber);
    });
  }
}
