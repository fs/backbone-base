define [
  'marionette'
  'views/articles/item'
], (Marionette, ArticleItemView) ->

  class ArticlesListView extends Marionette.CollectionView
    className: 'articles'
    itemView: ArticleItemView
