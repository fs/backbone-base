AppConfig = require('scripts/config')
Session = require('scripts/facades/session')

class AppCollection extends Backbone.Collection
  initialize: ->
    url = _.result(@, 'url')
    @url = AppConfig.apiPath + url
    super

  sync: (method, model, options) ->
    if Session.isLoggedIn()
      options.data = _.extend({}, options.data, Session.getToken())

    super

module.exports = AppCollection
