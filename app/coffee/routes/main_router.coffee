define [
  'Marionette' 
  'Controllers/main_controller'
], (Marionette, Controller) ->

  class MainRouter extends Backbone.Marionette.AppRouter
    controller: new Controller()
    appRoutes:
      '': 'indexPage'
      'page': 'somePage'
