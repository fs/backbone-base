gulp = require('gulp')
runSequence = require('run-sequence')
config = require('../config')

gulp.task 'production', ->
  config.env = 'production'
  runSequence('build')
