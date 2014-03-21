define [
  'application'
  'views/layouts/header_layout'
], (App, HeaderLayout) ->

  class NavigationController extends Marionette.Controller
    initialize: ->
      App.headerRegion.show(new HeaderLayout)
