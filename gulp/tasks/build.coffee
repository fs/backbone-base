gulp = require('gulp')
gulpgrunt = require('gulp-grunt')(gulp)
runSequence = require('run-sequence')

gulp.task 'build', ->
  runSequence(
    'install'
    'clean'
    [
      'copy'
      'templates'
      'stylesheets'
      'jsonlint'
      'coffeelint'
    ]
    'browserify'
    [
      'grunt-mocks'
      'browser-sync'
    ]
    'watch'
  )
