gulp = require('gulp')
coffeelint = require('gulp-coffeelint')
plumber = require('gulp-plumber')
config = require('../config')

gulp.task 'coffeelint', ->
  gulp.src("#{config.appDir}/scripts/**/*.coffee")
    .pipe(plumber())
    .pipe(coffeelint())
    .pipe(coffeelint.reporter())
