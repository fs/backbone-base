define [
  'marionette'
  'views/layout'
  'views/content/content_layout'
  'views/articles/articles_layout'
  'views/header/header_layout'
  'views/article/single_article'
  'models/user_session'
  'models/article'
  'collections/articles'
], (Marionette, LayoutView, ContentLayoutView, ArticlesLayoutView, HeaderLayoutView, SingleArticleView, UserSession, Article, Articles) ->

  class MainController extends Marionette.Controller
    initialize: ->
      @layout = new LayoutView
      @layout.render()
      @layout.headerRegion.show(new HeaderLayoutView)

    indexPage: ->
      @layout.mainRegion.show(new ContentLayoutView)

    logout: ->
      session = UserSession.getInstance()
      session.logout()
      @trigger('logout')

    showArticles: ->
      articles = new Articles()
      articles.fetch().then =>
        @layout.mainRegion.show(new ArticlesLayoutView({collection: articles}))

    showArticle: (id) ->
      model = new Article({id: id})
      model.fetch().then =>
        @layout.mainRegion.show(new SingleArticleView({model: model}))


