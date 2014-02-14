define [
  'marionette'
  'views/articles/articles'
  'views/articles/write_article'
], (Marionette, ArticlesView, WriteArticleView) ->

  class ArticlesLayoutView extends Marionette.Layout
    template: JST['templates/articles/articles_layout']

    regions:
      articlesRegion: '#articles_list_region'
      writeArticleRegion: '#write_article_region'

    toggleNavBar: ->
      @onRender()

    onRender: ->
      @articlesRegion.show(new ArticlesView({collection: @collection}))
      @writeArticleRegion.show(new WriteArticleView({collection: @collection}))
