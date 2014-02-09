define [
  'marionette'
  'models/user_session'
], (Marionette, UserSession) ->

  class AppCollection extends Backbone.Collection
    sync: (method, model, options) ->
      session = UserSession.getInstance()

      if session.isLogged()
        options.data = _.extend({}, options.data, session.getToken())
      
      super
