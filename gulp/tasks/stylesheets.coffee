gulp = require('gulp')
stylus = require('gulp-stylus')
cssimport = require('gulp-cssimport')
autoprefixer = require('autoprefixer-stylus')
jeet = require('jeet')
plumber = require('gulp-plumber')
notify = require('gulp-notify')
config = require('../config')

gulp.task 'stylesheets', ->
  gulp.src("#{config.appDir}/stylesheets/application.styl")
    .pipe(plumber())
    .pipe(stylus(
      linenos: true
      use: [
        autoprefixer(browsers: 'last 2 versions')
        jeet()
      ]
    ).on('error', notify.onError()))
    .pipe(cssimport())
    .pipe(gulp.dest("#{config.publicDir}"))
