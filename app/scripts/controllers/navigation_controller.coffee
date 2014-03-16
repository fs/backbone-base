define [
  'application'
  'views/layouts/header_layout'
  'facades/session'
], (App, HeaderLayout, Session) ->

  class NavigationController extends Marionette.Controller
    initialize: ->
      App.headerRegion.show(new HeaderLayout)

    logout: ->
      Session.destroy()
      @trigger('logout')
