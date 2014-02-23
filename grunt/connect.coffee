module.exports = (grunt) ->
  options:
    port: '<%= grunt.ports.connect %>'
    livereload: '<%= grunt.ports.livereload %>'
    hostname: 'localhost'
    middleware: (connect, options) ->
      proxy = require('grunt-connect-proxy/lib/utils').proxyRequest
      pushState = require('grunt-connect-pushstate/lib/utils').pushState
      [
        proxy
        pushState()
        connect.static(options.base)
        connect.directory(options.base)
      ]
  livereload:
    options:
      base: '<%= grunt.publicDir %>'
  proxies: [
    context: '/api'
    host: 'localhost'
    port: '<%= grunt.ports.easymock %>'
  ]
