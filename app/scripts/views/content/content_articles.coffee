define [
  'marionette'
  'views/content/content_article'
], (Marionette, ArticleView) ->

  class ContentArticlesView extends Marionette.CollectionView
    className: 'articles'
    itemView: ArticleView
    # itemViewOptions:
    #   collection: @collection

    initialize: ->
      console.log @collection
