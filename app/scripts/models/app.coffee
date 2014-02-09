define [
  'backbone'
  'models/user_session'
], (Backbone, UserSession) ->

  class AppModel extends Backbone.Model
    sync: (method, model, options) ->
      session = UserSession.getInstance()

      if session.isLogged()
        console.log session
        if _.contains(['create', 'update', 'patch'], method)
          data = _.extend(model.toJSON(), session.getToken())
          options.data = JSON.stringify(data)
          options.contentType = 'application/json'
        else
          options.data = _.extend({}, options.data, session.getToken())

      super
