define [
  'marionette'
  'views/layout'
  'views/content/content_layout'
  'views/articles/articles_layout'
  'views/header/header_layout'
  'views/article/single_article'
  'models/article'
  'collections/articles'
], (Marionette, LayoutView, ContentLayoutView, ArticlesLayoutView, HeaderLayoutView, SingleArticleView, Article, Articles) ->

  class MainController extends Marionette.Controller
    initialize: ->
      @layout = new LayoutView
      @layout.render()
      @layout.headerRegion.show(new HeaderLayoutView)

    indexPage: ->
      @layout.mainRegion.show(new ContentLayoutView)

    somePage: ->
      alert 'show some page'

    showArticles: ->
      articles = new Articles()
      articles.fetch().then =>
        @layout.mainRegion.show(new ArticlesLayoutView({collection: articles}))

    showArticle: (id) ->
      model = new Article({id: id})
      model.fetch().then =>
        @layout.mainRegion.show(new SingleArticleView({model: model}))
