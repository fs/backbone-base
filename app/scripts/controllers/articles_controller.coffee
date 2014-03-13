define [
  'controllers/base_controller'
  'views/layouts/articles_layout'
  'views/articles/show'
  'models/article'
  'collections/articles'
], (BaseController, ArticlesLayout, ArticlesShowView, Article, Articles) ->

  class ArticlesController extends BaseController
    index: ->
      articles = new Articles

      articles.fetch().then =>
        @layout.mainRegion.show(new ArticlesLayout(collection: articles))

    show: (id) ->
      model = new Article(id: id)

      model.fetch().then =>
        @layout.mainRegion.show(new ArticlesShowView(model: model))
