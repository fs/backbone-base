define [
  'marionette'
  'views/articles/list'
  'views/articles/form'
  'templates'
], (Marionette, ArticlesListView, ArticlesFormView) ->

  class ArticlesLayout extends Marionette.LayoutView
    template: JST['templates/layouts/articles_layout']

    collectionEvents:
      'add': 'onAddNewArticle'

    regions:
      articlesRegion: '#articles_list_region'
      writeArticleRegion: '#write_article_region'

    onRender: ->
      @articlesRegion.show(new ArticlesListView(collection: @collection))
      @writeArticleRegion.show(new ArticlesFormView(collection: @collection))

    onAddNewArticle: ->
      @writeArticleRegion.show(new ArticlesFormView(collection: @collection))
