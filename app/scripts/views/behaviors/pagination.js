import App from 'scripts/application';
import { props } from 'scripts/decorators';

@props({
  ui: {
    paginationContainer: '.pagination'
  },

  defaults: {
    maximumOfVisiblePages: 10
  }
})
export default class PaginationBehavior extends Marionette.Behavior {
  onRender() {
    this.initPagination(this.view.collection.pagination);
  }

  onDestroy() {
    this.ui.paginationContainer.off();
  }

  initPagination(pagination) {
    this.ui.paginationContainer.bootstrapPaginator({
      totalPages: pagination.pagesTotal,
      currentPage: pagination.page,
      numberOfPages: this.options.maximumOfVisiblePages,

      onPageClicked(event, originalEvent, type, page) {
        App.vent.trigger('page:change', page);
      }
    });
  }
}
