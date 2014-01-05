define [
  'Marionette' 
  'Controllers/main_controller'
], (Marionette, Controller) ->

  class MainRouter extends Backbone.Marionette.AppRouter
    controller: Controller
    appRoutes:
      '': 'indexPage'
