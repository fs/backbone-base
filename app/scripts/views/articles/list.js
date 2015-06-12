import ArticleItemView from 'scripts/views/articles/item';

export default class ArticlesListView extends Marionette.CollectionView {
  constructor(...args) {
    this.className = 'articles';
    this.childView = ArticleItemView;

    super(...args);
  }
}
