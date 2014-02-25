module.exports = (grunt) ->
  production:
    files:
      '<%= grunt.productionDir %>/style.css': '<%= grunt.publicDir %>/stylesheets/style.css'
