define [
  'marionette'
  'views/content/content_landing'
  'views/content/content_articles'
  'views/content/content_write_article'
  'models/user_session'
], (Marionette, ContentLandingView, ContentArticlesView, ContentWriteArticleView, UserSession) ->

  class ContentLayoutView extends Marionette.Layout
    template: JST['templates/content/content_layout']
    model: UserSession.getInstance()

    regions:
      contentRegion: '#content_container'
      writeArticleRegion: '#write_message_container'

    modelEvents:
      "change": "onUserLogged"

    onUserLogged: ->
      @onRender()

    onRender: ->
      if @model.isLogged()
        @contentRegion.show(new ContentArticlesView({collection: @collection}))
        @writeArticleRegion.show(new ContentWriteArticleView({collection: @collection}))
      else
        @contentRegion.show(new ContentLandingView)
