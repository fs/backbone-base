import Marionette from 'backbone.marionette';
import ArticleItemView from 'views/articles/item';
import { props } from 'decorators';

@props({
  className: 'articles',
  childView: ArticleItemView
})
export default class ArticlesListView extends Marionette.CollectionView {
  childViewOptions() {
    return { page: this.options.page };
  }
}
