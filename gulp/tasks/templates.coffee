gulp = require('gulp')
plumber = require('gulp-plumber')
jade = require('gulp-jade')
notify = require('gulp-notify')
config = require('../config')

gulp.task 'templates', ->
  jadeConfig =
    pretty: true
    data: {}

  gulp.src("#{config.appDir}/*.jade")
    .pipe(plumber())
    .pipe(jade(jadeConfig).on('error', notify.onError()))
    .pipe(gulp.dest("#{config.publicDir}/"))
