define [
  'controllers/base_controller'
  'views/content/landing'
  'views/layouts/header_layout'
  'facades/session'
], (BaseController, ContentLandingView, HeaderLayout, Session) ->

  class MainController extends BaseController
    initialize: ->
      super
      @layout.render()
      @layout.headerRegion.show(new HeaderLayout)

    index: ->
      @layout.mainRegion.show(new ContentLandingView)

    logout: ->
      Session.destroy()
      @trigger('logout')
