gulp = require('gulp')
config = require('./config')
clean = require('gulp-clean')
rimraf = require('gulp-rimraf')
ignore = require('gulp-ignore')
symlink = require('gulp-symlink')
rjs = require('gulp-requirejs')

module.exports.clean = ->
  gulp.src("#{config.publicDir}/", read: false)
    .pipe(rimraf())

module.exports.copy = ->
  gulp.src(['bower_components', 'vendor'])
    .pipe(symlink("#{config.publicDir}/"))
  gulp.src("#{config.appDir}/images/**/*")
    .pipe(gulp.dest("#{config.publicDir}/images/"))

module.exports.requirejs = ->
  rjs
    baseUrl: "#{config.publicDir}/scripts"
    mainConfigFile: "#{config.publicDir}/scripts/config.js"
    out: 'tt/application.js'
    preserveLicenseComments: false
    findNestedDependencies: true
    wrapShim: true
    # include: ['../../bower_components/almond/almond', 'main']
    optimize: 'uglify2'
    uglify2:
      output:
        beautify: false
      compress:
        global_defs:
          DEBUG: false
