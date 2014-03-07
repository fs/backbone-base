module.exports = (grunt) ->
  options:
    port: '<%= grunt.ports.connect %>'
    livereload: '<%= grunt.ports.livereload %>'
    hostname: 'localhost'
    middleware: (connect, options) ->
      proxy = require('grunt-connect-proxy/lib/utils').proxyRequest
      rewriteModule = require('http-rewrite-middleware')
      rewriteMiddleware = rewriteModule.getMiddleware [
        {from: '^/[^\.]*$', to: '/index.html'}
      ]

      [
        proxy
        rewriteMiddleware
        connect.static(options.base)
        connect.directory(options.base)
      ]
  development:
    options:
      base: '<%= grunt.publicDir %>'
  production:
    options:
      base: '<%= grunt.productionDir %>'
  proxies: [
    context: '/api'
    host: 'localhost'
    port: '<%= grunt.ports.easymock %>'
  ]
