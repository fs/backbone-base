gulp = require('gulp')
config = require('./config')
connect = require('gulp-connect')
proxyMiddleware = require("proxy-middleware")

module.exports = ->
  connect.server
    root: "#{config.publicDir}"
    port: config.ports.connect
    livereload: true
  middleware: (connect, o) ->
    [(->
      url = require("url")
      proxy = proxyMiddleware
      options = url.parse("http://localhost:#{config.ports.mocks}/mocks/api")
      options.route = "/api"
      proxy(options)
    )()]
