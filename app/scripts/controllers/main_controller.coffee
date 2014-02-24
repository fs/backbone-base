define [
  'marionette'
  'views/layouts/layout'
  'views/layouts/header_layout'
  'views/layouts/articles_layout'
  'views/content/landing'
  'views/articles/show'
  'views/dashboard/dashboard'
  'facades/session'
  'models/article'
  'collections/dashboard_articles'
  'collections/articles'
], (Marionette, Layout, HeaderLayout, ArticlesLayout, ContentLandingView, ArticlesShowView,
    DashboardView, Session, Article, DashboardArticles, Articles) ->

  class MainController extends Marionette.Controller
    initialize: ->
      @layout = new Layout
      @layout.render()
      @layout.headerRegion.show(new HeaderLayout)

    indexPage: ->
      @layout.mainRegion.show(new ContentLandingView)

    logout: ->
      Session.destroy()
      @trigger('logout')

    showDashboard: ->
      articles = new DashboardArticles()
      articles.fetch().then =>
        @layout.mainRegion.show(new DashboardView(collection: articles))

    showArticles: ->
      articles = new Articles()
      articles.fetch().then =>
        @layout.mainRegion.show(new ArticlesLayout(collection: articles))

    showArticle: (id) ->
      model = new Article(id: id)
      model.fetch().then =>
        @layout.mainRegion.show(new ArticlesShowView(model: model))
