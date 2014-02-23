module.exports = (grunt) ->
  production:
    options:
      removeComments: true
      collapseWhitespace: true
    files:
      '<%= grunt.productionDir %>/index.html': '<%= grunt.publicDir %>/index.html'
