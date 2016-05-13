import 'bootstrap-paginator';
import Marionette from 'backbone.marionette';
import App from 'application';
import { mixin } from 'core-decorators';

@mixin({
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
