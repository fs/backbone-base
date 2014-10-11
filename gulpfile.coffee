gulp = require('gulp')
gulpgrunt = require('gulp-grunt')(gulp)
runSequence = require('run-sequence')
config = require('./gulp/config')
utils = require('./gulp/utils')
scripts = require('./gulp/scripts')
stylesheets = require('./gulp/stylesheets')
templates = require('./gulp/templates')
server = require('./gulp/server')
tests = require('./gulp/tests')

gulp.task('install', utils.install)
gulp.task('clean', utils.clean)
gulp.task('copy', utils.copy)
gulp.task('requirejs', utils.rjs)
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
  config.environment = 'development'
  config.publicDir = 'public'
  runSequence(
    'install'
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

gulp.task 'production', (cb) ->
  config.environment = 'production'
  config.publicDir = 'public'
  runSequence(
    'install'
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
    cb
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
