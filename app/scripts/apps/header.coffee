define ['app', 'header_controller'], (App, HeaderController) ->

  App.module 'HeaderApp', (Header, App, Marionette) ->

    Header.on 'start', ->
      # HeaderController.

