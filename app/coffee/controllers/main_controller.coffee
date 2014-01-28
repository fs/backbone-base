define [
  'Marionette'
  'Views/layout_view'
  'Views/main/main_view'
  'Models/app_model'
], (Marionette, LayoutView, MainView, AppModel) ->

  class MainController extends Backbone.Marionette.Controller
    initialize: ->
      #create a pub sub
      @mediator = new Backbone.Wreqr.EventAggregator()
      #create a req/res
      @reqres = new Backbone.Wreqr.RequestResponse()
      #create commands
      @command = new Backbone.Wreqr.Commands()
      #render layout
      @layout = new LayoutView()

    indexPage: ->
      console.log 'main page loaded'
      @layout.mainRegion.show(new MainView())

    somePage: ->
      alert 'show some page'
