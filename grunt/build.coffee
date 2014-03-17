module.exports = (grunt) ->
  grunt.registerTask 'build', (target) ->
    if target is 'development'
      grunt.task.run [
        'shell:bower'
        'clean:development'
        'symlink:development'
        'concurrent:development'
      ]
    else if target is 'production'
      grunt.task.run [
        'shell:bower'
        'clean:development'
        'symlink:development'
        'concurrent:development'
        'clean:production'
        'jade:production'
        'targethtml:production'
        'cssmin:production'
        'requirejs:production'
      ]