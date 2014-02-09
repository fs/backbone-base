define [
  'marionette'
  'views/content/content_landing'
  'views/content/content_articles_collection'
  'models/user_session'
], (Marionette, ContentLandingView, ContentArticlesView, UserSession) ->

  class ContentLayoutView extends Marionette.Layout
    template: JST['templates/content/content_layout']
    model: UserSession.getInstance()

    regions:
      contentRegion: '#content_layout'

    modelEvents:
      "change": "onRender"

    onRender: ->
      console.log 'model changed'
      if @model.isLogged() then @contentRegion.show(new ContentArticlesView)
      else @contentRegion.show(new ContentLandingView)
