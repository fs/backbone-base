define [
  'marionette'
  'application'
  'views/layouts/header_layout'
], (Marionette, App, HeaderLayout) ->

  class NavigationController extends Marionette.Controller
    initialize: ->
      App.headerRegion.show(new HeaderLayout)
