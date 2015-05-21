gulp = require('gulp')
del = require('del')
config = require('../config')

gulp.task 'clean', (cb) ->
  del([config.publicDir], cb)
