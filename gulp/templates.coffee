gulp = require('gulp')
config = require('./config')
jade = require('gulp-jade')
concat = require('gulp-concat')
jadeAmdTemplates = require('./jade-amd-templates')

module.exports = ->
  gulp.src("#{config.appDir}/*.jade")
    .pipe(jade(
      client: false
      pretty: true
      data:
        development: true
    ))
    .pipe(gulp.dest("#{config.publicDir}/"))
  gulp.src("#{config.appDir}/templates/**/*.jade")
    .pipe(jade(client: true))
    .pipe(jadeAmdTemplates.jst())
    .pipe(concat('templates.js'))
    .pipe(jadeAmdTemplates.amd())
    .pipe(gulp.dest("#{config.publicDir}/scripts/"))
    # .pipe(livereload())
