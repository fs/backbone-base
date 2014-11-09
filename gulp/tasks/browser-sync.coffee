gulp = require('gulp')
browserSync = require('browser-sync')
httpProxy = require('http-proxy')
config = require('../config')

gulp.task 'browser-sync', ->
  proxy = httpProxy.createProxyServer({})

  browserSync
    port: config.ports.server
    open: false
    notify: false
    server:
      baseDir: "#{config.publicDir}"
      middleware: (req, res, next) ->
        if req.url.indexOf('api') isnt -1
          proxy.web(req, res, target: "http://localhost:#{config.ports.mocks}/mocks/api")
        else
          next()
    files: [
      "#{config.publicDir}/**"
      "!#{config.publicDir}/**.map"
    ]
