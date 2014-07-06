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
        'targethtml:development'
      ]
    else if target is 'production'
      grunt.task.run [
        'shell:bower'
        'clean:development'
        'symlink:development'
        'copy:production'
        'concurrent:development'
        'clean:production'
        'jade:production'
        'targethtml:production'
        'cssmin:production'
        'requirejs:production'
      ]
