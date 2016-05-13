import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import ArticleItemView from 'views/articles/item';

@mixin({
  className: 'articles-list',
  childView: ArticleItemView
})
export default class ArticlesListView extends Marionette.CollectionView {
  childViewOptions() {
    return { page: this.options.page };
  }
}
