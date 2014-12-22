require('backbone-routefilter')
require('backbone-stickit')
require('backbone-validation')
require('marionette')
require('bootstrap')
require('jade')

require('scripts/modules/landing')
require('scripts/modules/dashboard')
require('scripts/modules/articles')
require('scripts/modules/navigation')

App = require('scripts/application')

$ -> App.start()

$(document).on 'click', '.js-link', (event) ->
  event.preventDefault()
  href = $(event.currentTarget).attr('href')
  Backbone.history.navigate(href, trigger: true)
