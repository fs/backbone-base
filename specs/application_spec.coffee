define [
  'marionette'
], (Marionette) ->

  describe 'Application', ->
    beforeEach ->
      @app = new Backbone.Marionette.Application

    it 'should start successfully', ->
      expect(@app.start).to.not.throw(Error)
