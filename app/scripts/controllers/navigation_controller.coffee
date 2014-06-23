define [
  'marionette'
  'application'
  'views/layouts/navigation_layout'
], (Marionette, App, NavigationLayout) ->

  class NavigationController extends Marionette.Controller
    initialize: ->
      App.navigationRegion.show(new NavigationLayout)
