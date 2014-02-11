define [
  'backbone'
  'models/user_session'
], (Backbone, UserSession) ->

  class AppModel extends Backbone.Model
    sync: (method, model, options) ->
      if UserSession.isLogged()
        if _.contains(['create', 'update', 'patch'], method)
          data = _.extend(model.toJSON(), UserSession.getToken())
          options.data = JSON.stringify(data)
          options.contentType = 'application/json'
        else
          options.data = _.extend({}, options.data, UserSession.getToken())

      super
