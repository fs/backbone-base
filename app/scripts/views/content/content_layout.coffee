define [
  'marionette'
  'views/content/content_landing'
  'views/content/content_article'
  'models/user_session'
], (Marionette, ContentLandingView, ContentArticleView, UserSession) ->

  class ContentLayoutView extends Marionette.Layout
    template: JST['templates/content/content_layout']
    model: UserSession.getInstance()

    regions:
      contentRegion: '#content_layout'

    modelEvents:
      "change": "onRender"

    onRender: ->
      console.log 'model changed'
      if @model.isLogged() then @contentRegion.show(new ContentArticleView)
      else @contentRegion.show(new ContentLandingView)
