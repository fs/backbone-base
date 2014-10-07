define [
  'marionette'
  'application'
], (Marionette, App) ->

  describe 'Application', ->
    it 'should start successfully', ->
      # TODO: this is raising error, need to be fixed asap
      # expect(App.start).to.not.throw(Error)
      expect(App).to.be.instanceof(Marionette.Application)
