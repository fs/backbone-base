gulp = require('gulp')
stylus = require('gulp-stylus')
cssimport = require('gulp-cssimport')
plumber = require('gulp-plumber')
notify = require('gulp-notify')
config = require('../config')

gulp.task 'stylesheets', ->
  gulp.src("#{config.appDir}/stylesheets/application.styl")
    .pipe(plumber())
    .pipe(stylus(
      sourcemap:
        inline: true
        sourceRoot: '.'
        basePath: "#{config.appDir}/stylesheets"
    ).on('error', notify.onError()))
    .pipe(cssimport())
    .pipe(gulp.dest("#{config.publicDir}"))
