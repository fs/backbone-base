Session = require('../facades/session.coffee')

class AppModel extends Backbone.Model
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
