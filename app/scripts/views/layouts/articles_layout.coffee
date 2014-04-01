define [
  'marionette'
  'views/articles/list'
  'views/articles/form'
  'templates'
], (Marionette, ArticlesListView, ArticlesFormView) ->

  class ArticlesLayout extends Marionette.Layout
    template: JST['templates/layouts/articles_layout']

    regions:
      articlesRegion: '#articles_list_region'
      writeArticleRegion: '#write_article_region'

    onRender: ->
      @articlesRegion.show(new ArticlesListView(collection: @collection))
      @writeArticleRegion.show(new ArticlesFormView(collection: @collection))
