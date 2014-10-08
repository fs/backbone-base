gulp = require('gulp')
gulpgrunt = require('gulp-grunt')(gulp)
runSequence = require('gulp-run-sequence')
config = require('./config')
utils = require('./utils')
scripts = require('./scripts')
stylesheets = require('./stylesheets')
templates = require('./templates')
server = require('./server')
tests = require('./tests')

gulp.task('clean', utils.clean)
gulp.task('copy', utils.copy)
gulp.task('requirejs', utils.requirejs)
gulp.task('scripts', scripts)
gulp.task('stylesheets', stylesheets)
gulp.task('templates', templates)
gulp.task('server', server)
gulp.task('karma', (done) -> tests(done))

gulp.task 'watch', ->
  gulp.watch("#{config.appDir}/scripts/**/*.coffee", ['scripts'])
  gulp.watch("#{config.appDir}/stylesheets/**/*.styl", ['stylesheets'])
  gulp.watch("#{config.appDir}/templates/**/*.jade", ['templates'])

gulp.task 'development', ->
  config.publicDir = 'public'
  runSequence(
    'clean'
    [
      'copy'
      'templates'
      'stylesheets'
      'scripts'
      'server'
      'grunt-mocks'
      'watch'
    ]
  )

gulp.task 'production', ->
  config.publicDir = 'production'
  runSequence(
    'clean'
    [
      'copy'
      'templates'
      'stylesheets'
      'scripts'
      'server'
      'grunt-mocks'
    ]
    'requirejs'
    'watch'
  )

gulp.task 'test', ->
  config.publicDir = 'public'
  runSequence(
    [
      'copy'
      'scripts'
    ]
    'karma'
  )

gulp.task('default', ['development'])
