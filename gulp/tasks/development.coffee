gulp = require('gulp')
runSequence = require('run-sequence')
config = require('../config')

gulp.task 'development', ->
  config.env = 'development'
  runSequence('build')
