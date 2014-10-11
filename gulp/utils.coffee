gulp = require('gulp')
install = require('gulp-install')
config = require('./config')
clean = require('gulp-clean')
rimraf = require('gulp-rimraf')
ignore = require('gulp-ignore')
symlink = require('gulp-symlink')
rjs = require('gulp-requirejs')

module.exports.install = ->
  gulp.src(['./bower.json'])
    .pipe(install())

module.exports.clean = ->
  gulp.src("#{config.publicDir}/", read: false)
    .pipe(rimraf())

module.exports.copy = ->
  if config.environment is 'development'
    gulp.src(['bower_components', 'vendor'])
      .pipe(symlink("#{config.publicDir}/"))
  else
    gulp.src(['bower_components/**/*', 'vendor/**/*'], base: './')
      .pipe(gulp.dest("#{config.publicDir}/"))

  gulp.src("#{config.appDir}/images/**/*")
    .pipe(gulp.dest("#{config.publicDir}/images/"))

module.exports.rjs = ->
  rjs
    baseUrl: "#{config.publicDir}/scripts"
    mainConfigFile: "#{config.publicDir}/scripts/config.js"
    out: 'application.js'
    preserveLicenseComments: false
    findNestedDependencies: true
    wrapShim: true
    include: ['../bower_components/almond/almond', 'main']
    optimize: 'uglify2'
    uglify2:
      output:
        beautify: true
      compress:
        global_defs:
          DEBUG: false
  .pipe(gulp.dest("#{config.publicDir}"))

