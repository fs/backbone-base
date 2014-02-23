module.exports = (grunt) ->
  api:
    options:
      port: '<%= grunt.ports.easymock %>'
      path: 'mocks'
