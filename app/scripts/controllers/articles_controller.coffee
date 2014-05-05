define [
  'marionette'
  'application'
  'views/layouts/articles_layout'
  'views/articles/show'
  'models/article'
  'collections/articles'
], (Marionette, App, ArticlesLayout, ArticlesShowView, Article, Articles) ->

  class ArticlesController extends Marionette.Controller
    index: ->
      articles = new Articles

      articles.fetch().then ->
        App.mainRegion.show(new ArticlesLayout(collection: articles))

    show: (id) ->
      model = new Article(id: id)

      model.fetch().then ->
        App.mainRegion.show(new ArticlesShowView(model: model))
