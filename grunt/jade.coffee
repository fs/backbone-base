module.exports = (grunt) ->
  html:
    options:
      pretty: true
      client: false
    files: [
      '<%= grunt.publicDir %>/index.html': ['<%= grunt.appDir %>/index.jade']
    ]
  production:
    options:
      pretty: true
      client: false
    files: [
      '<%= grunt.productionDir %>/index.html': ['<%= grunt.appDir %>/index.jade']
    ]
  jst:
    options:
      pretty: false
      client: true
      amd: true
      processName: (filename) ->
        filename.slice(filename.indexOf('templates'), filename.length - 5)
    files: [
      '<%= grunt.publicDir %>/scripts/templates.js': ['<%= grunt.appDir %>/templates/**/*.jade']
    ]
  watch:
    options:
      pretty: false
      client: true
      amd: true
      processName: (filename) ->
        filename.slice(filename.indexOf('templates'), filename.length - 5)
    files: {}
