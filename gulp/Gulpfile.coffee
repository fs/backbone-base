gulp = require('gulp')
gutil = require('gulp-util')
clean = require('gulp-clean')
copy = require('gulp-copy')
wrap = require('gulp-wrap-amd')
jade = require('gulp-jade')
stylus = require('gulp-stylus')
coffee = require('gulp-coffee')
coffeelint = require('gulp-coffeelint')
livereload = require('gulp-livereload')
concat = require('gulp-concat')
uglify = require('gulp-uglify')
connect = require('gulp-connect')
jstConcat = require('gulp-jst-concat')
rimraf = require('rimraf')

application =
  appDir: 'app'
  publicDir: 'public'
  productionDir: 'production'
  testDir: 'specs'
  ports:
    connect: 8000
    easymock: 8001

gulp.task 'clean', (cb) ->
  rimraf("#{application.publicDir}/", cb)

gulp.task 'copy', ['clean'], ->
  gulp.src(['bower_components/**/*', 'vendor/**/*'], base: './')
    .pipe(gulp.dest("#{application.publicDir}/"))

gulp.task 'templates', ->
  gulp.src("#{application.appDir}/*.jade")
    .pipe(jade(
      client: false
      pretty: true
      data:
        development: true
    ))
    .pipe(gulp.dest("#{application.publicDir}/"))
  gulp.src("#{application.appDir}/templates/**/*.jade")
    .pipe(jade(
      client: true
      pretty: false
    ))
    .pipe(wrap(
      deps: ['jade']
      params: ['jade']
    ))
    .pipe(jstConcat('templates.js', {
      renameKeys: ['^.*app/(.*).js$', '$1']
    }))
    .pipe(gulp.dest("#{application.publicDir}/scripts/"))
    # .pipe(livereload())

gulp.task 'stylesheets', ->
  gulp.src("#{application.appDir}/stylesheets/**/*.styl")
    .pipe(stylus())
    .pipe(concat('style.css'))
    .pipe(gulp.dest("#{application.publicDir}/stylesheets/"))
    # .pipe(livereload())

gulp.task 'scripts', ->
  gulp.src("#{application.appDir}/scripts/**/*.coffee")
    .pipe(coffeelint())
    .pipe(coffeelint.reporter())
    .pipe(coffee().on('error', gutil.log))
    .pipe(gulp.dest("#{application.publicDir}/scripts/"))
    # .pipe(livereload())

gulp.task 'connect', ->
  connect.server
    root: "#{application.publicDir}"
    port: application.ports.connect
    livereload: true

gulp.task 'build', ['clean'], ->
  gulp.run(
    'copy'
    'templates'
    'stylesheets'
    'scripts'
    'connect'
  )

gulp.task 'watch', ->
  gulp.watch("#{application.appDir}/scripts/**/*.coffee", ['scripts'])
  gulp.watch("#{application.appDir}/stylesheets/**/*.styl", ['stylesheets'])
  gulp.watch("#{application.appDir}/templates/**/*.jade", ['templates'])

gulp.task 'default', ['build', 'watch']