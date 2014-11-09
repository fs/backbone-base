gulp = require('gulp')
config = require('../config')

gulp.task 'watch', ->
  gulp.watch("#{config.appDir}/stylesheets/**/*.styl", ['stylesheets'])
  gulp.watch("#{config.appDir}/*.jade", ['templates'])
