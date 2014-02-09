define [
  'marionette'
  'views/content/content_article'
  'collections/articles'
], (Marionette, ArticleView, ArticleCollection) ->

  class ContentArticlesView extends Marionette.CollectionView
    className: 'articles'
    itemView: ArticleView

    initialize: ->
      @collection = new ArticleCollection()
      @collection.fetch data:
        user_name: 'M@rik'

      console.log @collection
