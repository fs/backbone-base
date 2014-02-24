module.exports = (grunt) ->
  production:
    files:
      '<%= grunt.productionDir %>/style.css': '<%= grunt.productionDir %>/stylesheets/style.css'
