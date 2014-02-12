define [
  'marionette'
  'views/layout'
  'views/content/content_layout'
  'views/header/header_layout'
  'models/user_session'
  'collections/articles'
], (Marionette, LayoutView, ContentLayoutView, HeaderLayoutView, UserSession, Articles) ->

  class MainController extends Marionette.Controller
    initialize: ->
      @layout = new LayoutView
      @layout.render()
      @layout.headerRegion.show(new HeaderLayoutView)

    indexPage: ->
      if UserSession.isLogged()
        articles = new Articles()
        articles.fetch()
        @layout.mainRegion.show(new ContentLayoutView({collection: articles}))

    somePage: ->
      alert 'show some page'
