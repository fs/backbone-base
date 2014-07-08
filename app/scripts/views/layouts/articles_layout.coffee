define [
  'marionette'
  'views/articles/list'
  'views/articles/form'
  'templates'
], (Marionette, ArticlesListView, ArticlesFormView) ->

  class ArticlesLayout extends Marionette.LayoutView
    template: JST['templates/layouts/articles_layout']

    regions:
      articlesRegion: '#articles_list_region'
      writeArticleRegion: '#write_article_region'

    initialize: ->
      @listenTo @collection, 'add', @onAddNewArticle

    onRender: ->
      @articlesRegion.show(new ArticlesListView(collection: @collection))
      @_showFormView()

    onAddNewArticle: ->
      @_showFormView()

    _showFormView: ->
      @writeArticleRegion.show(new ArticlesFormView(collection: @collection))
