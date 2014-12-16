AppConfig = require('scripts/config')
Session = require('scripts/facades/session')

class AppModel extends Backbone.Model
  initialize: ->
    @urlRoot = AppConfig.apiPath + _.result(@, 'urlRoot')
    super

  sync: (method, model, options) ->
    if Session.isLoggedIn()
      if method in ['create', 'update', 'patch']
        data = _.extend(model.toJSON(), Session.getToken())
        options.data = JSON.stringify(data)
        options.contentType = 'application/json'
      else
        options.data = _.extend({}, options.data, Session.getToken())

    super

module.exports = AppModel
