define [
  'marionette'
  'views/content/content_landing'
  'views/content/greeting'
  'models/user_session'
], (Marionette, ContentLandingView, GreetingView, UserSession) ->

  class ContentLayoutView extends Marionette.Layout
    template: JST['templates/content/content_layout']
    model: UserSession.getInstance()

    regions:
      contentRegion: '#content_container'

    modelEvents:
      "change": "onUserLogged"

    onUserLogged: ->
      @onRender()

    onRender: ->
      if @model.isLogged()
        @contentRegion.show(new GreetingView(model: @model))
      else
        @contentRegion.show(new ContentLandingView)
