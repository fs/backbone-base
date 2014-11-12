require('backbone-routefilter')
require('backbone-stickit')
require('backbone-validation')
require('marionette')
require('bootstrap')
require('jade')

require('./modules/navigation')
require('./modules/landing')
require('./modules/dashboard')
require('./modules/articles')

App = require('./application')

$ -> App.start()
