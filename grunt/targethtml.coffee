module.exports = (grunt) ->
  development:
    files:
      '<%= grunt.publicDir %>/index.html': '<%= grunt.publicDir %>/index.html'
  production:
    files:
      '<%= grunt.productionDir %>/index.html': '<%= grunt.productionDir %>/index.html'
