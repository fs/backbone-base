gulp = require('gulp')
config = require('./config')
jade = require('gulp-jade')
concat = require('gulp-concat')
jadeAmdTemplates = require('./jade-amd-templates')

module.exports = ->
  jadeConfig =
    client: false
    pretty: true
    data: {}

  if config.environment is 'development'
    jadeConfig.data['development'] = true

  gulp.src("#{config.appDir}/*.jade")
    .pipe(jade(jadeConfig))
    .pipe(gulp.dest("#{config.publicDir}/"))
  gulp.src("#{config.appDir}/templates/**/*.jade")
    .pipe(jade(client: true))
    .pipe(jadeAmdTemplates.jst())
    .pipe(concat('templates.js'))
    .pipe(jadeAmdTemplates.amd())
    .pipe(gulp.dest("#{config.publicDir}/scripts/"))
    # .pipe(livereload())
