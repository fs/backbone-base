gulp = require('gulp')
config = require('../config')

gulp.task 'copy', ->
  gulp.src([
    "#{config.appDir}/images/**/*"
    "#{config.appDir}/fonts/**/*"
    "!#{config.appDir}/images/sprites{,/**}"
  ], base: "#{config.appDir}/")
  .pipe(gulp.dest("#{config.publicDir}"))
