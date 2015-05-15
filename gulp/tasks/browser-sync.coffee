gulp = require('gulp')
browserSync = require('browser-sync')
historyApiFallback = require('connect-history-api-fallback')
prism = require('connect-prism')
config = require('../config')

gulp.task 'browser-sync', ->
  prism.create(
    name: 'serve'
    mode: 'mock'
    context: '/api'
    host: 'localhost'
    port: 8001
    delay: 0
    rewrite: {}
    mockFilenameGenerator: (config, req) ->
      req._parsedUrl.pathname.replace(/^\//, '') + '.json'
  )

  browserSync
    port: config.ports.server
    open: false
    notify: false
    server:
      baseDir: config.publicDir
      middleware: [prism.middleware, historyApiFallback]
    files: [
      "#{config.publicDir}/**"
      "!#{config.publicDir}/**.map"
    ]
