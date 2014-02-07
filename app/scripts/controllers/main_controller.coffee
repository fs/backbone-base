define [
  'marionette'
  'views/layout_view'
  'views/main/main_layout_view'
  'models/app_model'
], (Marionette, LayoutView, MainView, AppModel) ->

  class MainController extends Marionette.Controller
    initialize: ->
      @layout = new LayoutView
      @layout.render()

    indexPage: ->
      @layout.mainRegion.show(new MainView)

    somePage: ->
      alert 'show some page'
