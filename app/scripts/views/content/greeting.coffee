define [
  'marionette'
], (Marionette) ->

  class Greeting extends Marionette.ItemView
    template: JST['templates/content/greeting']
    modelEvents:
      'change': 'render'
