define [
  'marionette'
  'models/user_session'
], (Marionette, UserSession) ->

  class AppCollection extends Backbone.Collection
    sync: (method, model, options) ->
      if UserSession.isLogged()
        options.data = _.extend({}, options.data, UserSession.getToken())

      super
