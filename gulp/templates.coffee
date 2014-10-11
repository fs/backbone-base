gulp = require('gulp')
plumber = require('gulp-plumber')
config = require('./config')
jade = require('gulp-jade')
concat = require('gulp-concat')
helpers = require('./helpers')
notify = require('gulp-notify')

module.exports = ->
  jadeConfig =
    client: false
    pretty: true
    data: {}

  if config.environment is 'development'
    jadeConfig.data['development'] = true

  gulp.src("#{config.appDir}/*.jade")
    .pipe(plumber())
    .pipe(jade(jadeConfig).on('error', notify.onError()))
    .pipe(gulp.dest("#{config.publicDir}/"))
  gulp.src("#{config.appDir}/templates/**/*.jade")
    .pipe(plumber())
    .pipe(jade(client: true).on('error', notify.onError()))
    .pipe(helpers.jst())
    .pipe(concat('templates.js'))
    .pipe(helpers.jadeAmd())
    .pipe(gulp.dest("#{config.publicDir}/scripts/"))
    # .pipe(livereload())
