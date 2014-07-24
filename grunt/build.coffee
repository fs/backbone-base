module.exports = (grunt) ->
  grunt.registerTask 'build', (target) ->
    if target is 'development'
      grunt.task.run [
        'shell:bower'
        'clean:development'
        'symlink:development'
        'copy:development'
        'concurrent:development'
        'jade:html'
      ]
    else if target is 'production'
      grunt.task.run [
        'shell:bower'
        'clean:development'
        'symlink:development'
        'concurrent:development'
        'clean:production'
        'copy:production'
        'jade:production'
        'cssmin:production'
        'requirejs:production'
      ]
