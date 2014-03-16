define [
  'controllers/base_controller'
  'views/layouts/header_layout'
  'facades/session'
], (BaseController, HeaderLayout, Session) ->

  class HeaderController extends BaseController
    initialize: ->
      super
      @layout.headerRegion.show(new HeaderLayout)

    logout: ->
      Session.destroy()
      @trigger('logout')
