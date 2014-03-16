module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
  grunt.appDir = 'app'
  grunt.publicDir = 'public'
  grunt.productionDir = 'production'
  grunt.testDir = 'specs'
  grunt.ports =
    livereload: 35729
    connect: 8000
    easymock: 8001

  grunt.event.on 'watch', (action, filepath) ->
    file = {}

    if /(.coffee)/.test filepath
      dest = filepath.replace("#{grunt.appDir}/scripts", "#{grunt.publicDir}/scripts").replace('.coffee', '.js')
      file[dest] = filepath
      grunt.config 'coffeelint.watch.files', file
      grunt.config 'coffee.watch.files', file
    else if /(.styl)/.test filepath
      dest = "#{grunt.publicDir}/stylesheets/style.css"
      file[dest] = "#{grunt.appDir}/stylesheets/application.styl"
      grunt.config 'stylus.watch.files', file
    else if /(.jade)/.test filepath
      dest = "#{grunt.publicDir}/scripts/templates.js"
      file[dest] = "#{grunt.appDir}/templates/**/*.jade"
      grunt.config 'jade.watch.files', file

  require('load-grunt-config')(grunt)

  grunt.registerTask 'build', (target) ->
    if target == 'development'
      grunt.task.run [
        'shell:bower'
        'clean:development'
        'symlink:development'
        'concurrent:development'
      ]
    else if target == 'production'
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

  grunt.registerTask 'server', (target) ->
    if target == 'development'
      grunt.task.run [
        'connect:development'
        'easymock'
        'configureProxies:server'
        'watch:development'
      ]
    else if target == 'production'
      grunt.task.run [
        'connect:production'
        'easymock'
        'configureProxies:server'
        'watch:production'
      ]

  grunt.registerTask 'test', [
    'build:development'
    'karma'
  ]

  grunt.registerTask 'development', [
    'build:development'
    'server:development'
  ]

  grunt.registerTask 'production', [
    'build:production'
    'server:production'
  ]

  grunt.registerTask 'default', [
    'development'
  ]
