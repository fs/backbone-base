define [
  'marionette'
  'views/layouts/layout'
], (Marionette, Layout) ->

  class BaseController extends Marionette.Controller
    initialize: ->
      @layout = new Layout
