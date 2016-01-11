import _ from 'underscore';
import AppCollection from 'scripts/collections/app';

export default class PaginatedCollection extends AppCollection {
  parse(response) {
    const pagination = response.meta.pagination;
    const pagesTotal = Math.ceil(pagination.total / pagination.per_page);
    const collectionKey = this.rootKey || _.findKey(response, (value) => Array.isArray(value));

    this.pagination = {
      pagesTotal,
      page: pagination.page,
      perPage: pagination.per_page,
      total: pagination.total
    };

    return super.parse(response[collectionKey]);
  }

  fetchByPage(page = 1) {
    return this.fetch({ data: { page } });
  }
}
