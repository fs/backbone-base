Session = require('../facades/session')

class AppCollection extends Backbone.Collection
  sync: (method, model, options) ->
    if Session.isLoggedIn()
      options.data = _.extend({}, options.data, Session.getToken())

    super

module.exports = AppCollection
