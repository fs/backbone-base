define [
  'marionette'
  'models/user_session_model'
], (Marionette) ->

  class AppCollection extends Backbone.Collection
    sync: (method, model, options) ->
      session = UserSession.getInstance()
      console.log session
      options.data = _.extend({}, options.data, auth_token: 'token')
      super
