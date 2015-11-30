import ArticleItemView from 'scripts/views/articles/item';
import { props } from 'scripts/decorators';

@props({
  className: 'articles',
  childView: ArticleItemView
})
export default class ArticlesListView extends Marionette.CollectionView {
  childViewOptions() {
    return { page: this.options.page }
  }
}
