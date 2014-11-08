Session = require('../facades/session.coffee')

class AppCollection extends Backbone.Collection
  sync: (method, model, options) ->
    if Session.isLoggedIn()
      options.data = _.extend({}, options.data, Session.getToken())

    super
