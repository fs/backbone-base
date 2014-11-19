AppConfig = require('scripts/config')
Session = require('scripts/facades/session')

class AppModel extends Backbone.Model
  initialize: ->
    urlRoot = _.result(@, 'urlRoot')
    @urlRoot = AppConfig.apiPath + urlRoot
    super

  sync: (method, model, options) ->
    if Session.isLoggedIn()
      if _.contains(['create', 'update', 'patch'], method)
        data = _.extend(model.toJSON(), Session.getToken())
        options.data = JSON.stringify(data)
        options.contentType = 'application/json'
      else
        options.data = _.extend({}, options.data, Session.getToken())

    super

module.exports = AppModel
