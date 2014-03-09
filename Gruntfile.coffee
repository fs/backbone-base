module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
  grunt.appDir = 'app'
  grunt.publicDir = 'public'
  grunt.productionDir = 'production'
  grunt.testDir = 'tests'
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

    if /(.styl)/.test filepath
      dest = "#{grunt.publicDir}/stylesheets/style.css"
      file[dest] = "#{grunt.appDir}/stylesheets/application.styl"
      grunt.config 'stylus.watch.files', file

    if /(.jade)/.test filepath
      dest = "#{grunt.publicDir}/scripts/templates.js"
      file[dest] = "#{grunt.appDir}/templates/**/*.jade"
      grunt.config 'jade.watch.files', file

    console.log "files -----> ", file
    true

  require('load-grunt-config')(grunt)
