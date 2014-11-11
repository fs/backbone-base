gulp = require('gulp')
browserSync = require('browser-sync')
prism = require('connect-prism')
config = require('../config')

gulp.task 'browser-sync', ->
  browserSync
    port: config.ports.server
    open: false
    notify: false
    server:
      baseDir: "#{config.publicDir}"
      middleware: (req, res, next) ->
        prism.middleware(req, res, next)
    files: [
      "#{config.publicDir}/**"
      "!#{config.publicDir}/**.map"
    ]
