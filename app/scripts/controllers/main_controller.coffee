define [
  'marionette'
  'views/layout'
  'views/content/content_main'
], (Marionette, LayoutView, MainView) ->

  class MainController extends Marionette.Controller
    initialize: ->
      @layout = new LayoutView
      @layout.render()

    indexPage: ->
      @layout.mainRegion.show(new MainView)

    somePage: ->
      alert 'show some page'
