define [
  'marionette'
], (Marionette) ->

  #maybe need to implement with a singletone pattern?
  new Backbone.Wreqr.EventAggregator()
