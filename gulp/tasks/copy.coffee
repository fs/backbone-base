gulp = require('gulp')
config = require('../config')

gulp.task 'copy', ->
  gulp.src("#{config.appDir}/images/**/*")
    .pipe(gulp.dest("#{config.publicDir}/images/"))
