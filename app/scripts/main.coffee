require('backbone-routefilter')
require('backbone-stickit')
require('backbone-validation')
require('marionette')
require('bootstrap')
require('scripts/modules/landing')
require('scripts/modules/dashboard')
require('scripts/modules/articles')
require('scripts/modules/navigation')

App = require('scripts/application')

$ -> App.start()
