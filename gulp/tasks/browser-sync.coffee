gulp = require('gulp')
browserSync = require('browser-sync')
historyApiFallback = require('connect-history-api-fallback')
prism = require('connect-prism')
config = require('../config')

gulp.task 'browser-sync', ->
  browserSync
    port: config.ports.server
    open: false
    notify: false
    server:
      baseDir: "#{config.publicDir}"
      middleware: [prism.middleware, historyApiFallback]
    files: [
      "#{config.publicDir}/**"
      "!#{config.publicDir}/**.map"
    ]
