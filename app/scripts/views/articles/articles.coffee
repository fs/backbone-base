define [
  'marionette'
  'views/articles/article'
], (Marionette, ArticleView) ->

  class ContentArticlesView extends Marionette.CollectionView
    className: 'articles'
    itemView: ArticleView
