gulp = require('gulp')
gulpgrunt = require('gulp-grunt')(gulp)
gutil = require('gulp-util')
clean = require('gulp-clean')
ignore = require('gulp-ignore')
rimraf = require('gulp-rimraf')
symlink = require('gulp-symlink')
jade = require('gulp-jade')
stylus = require('gulp-stylus')
cssimport = require('gulp-cssimport')
coffee = require('gulp-coffee')
coffeelint = require('gulp-coffeelint')
jsonlint = require('gulp-jsonlint')
livereload = require('gulp-livereload')
concat = require('gulp-concat')
connect = require('gulp-connect')
rjs = require('gulp-requirejs')
proxyMiddleware = require("proxy-middleware")
karma = require('karma').server

jadeAmdJST = require('./jade-amd-jst')

application =
  appDir: 'app'
  publicDir: 'public'
  productionDir: 'production'
  testDir: 'specs'
  ports:
    connect: 8000
    test: 9999

gulp.task 'clean', ->
  gulp.src("#{application.publicDir}/", read: false)
    .pipe(rimraf())

gulp.task 'copy', ->
  gulp.src(['bower_components', 'vendor'])
    .pipe(symlink("#{application.publicDir}/"))
  gulp.src("#{application.appDir}/images/**/*")
    .pipe(gulp.dest("#{application.publicDir}/images/"))

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
    .pipe(jade(client: true))
    .pipe(jadeAmdJST.modify())
    .pipe(concat('templates.js'))
    .pipe(jadeAmdJST.append())
    .pipe(gulp.dest("#{application.publicDir}/scripts/"))
    # .pipe(livereload())

gulp.task 'stylesheets', ->
  gulp.src("#{application.appDir}/stylesheets/**/*.styl")
    .pipe(stylus(linenos: true))
    .pipe(concat('style.css'))
    .pipe(cssimport())
    .pipe(gulp.dest("#{application.publicDir}/stylesheets/"))
    # .pipe(livereload())

gulp.task 'scripts', ->
  gulp.src("#{application.appDir}/scripts/**/*.coffee")
    .pipe(coffeelint())
    .pipe(coffeelint.reporter())
    .pipe(coffee().on('error', gutil.log))
    .pipe(gulp.dest("#{application.publicDir}/scripts/"))
    # .pipe(livereload())

gulp.task 'jsonlint', ->
  gulp.src('mocks/**/*.json')
    .pipe(jsonlint())
    .pipe(jsonlint.reporter())

gulp.task 'connect', ->
  connect.server
    root: "#{application.publicDir}"
    port: 8000
    livereload: true
  middleware: (connect, o) ->
    [(->
      url = require("url")
      proxy = proxyMiddleware
      options = url.parse("http://localhost:8001/mocks/api")
      options.route = "/api"
      proxy(options)
    )()]

gulp.task 'karma', (done) ->
  karma.start(
    basePath: ''
    frameworks: ['mocha', 'requirejs', 'chai', 'sinon']
    runnerPort: application.ports.test
    singleRun: true
    browsers: ['PhantomJS']
    files: [
      {pattern: "#{application.publicDir}/bower_components/**/*.js", included: false}
      {pattern: "#{application.publicDir}/vendor/**/*.js", included: false}
      {pattern: "#{application.publicDir}/scripts/**/*.js", included: false}
      {pattern: "#{application.testDir}/**/*_spec.coffee", included: false}
      "#{application.testDir}/runner.coffee"
    ]
    exclude: [
      "#{application.publicDir}/scripts/config.js"
    ]
    reporters: ['dots']
    colors: true
    preprocessors:
      'specs/**/*.coffee': ['coffee']
    plugins: [
      'karma-mocha'
      'karma-chai'
      'karma-sinon'
      'karma-requirejs'
      'karma-chrome-launcher'
      'karma-phantomjs-launcher'
      'karma-coffee-preprocessor'
    ]
    client:
      mocha:
        ui: 'bdd'
  , done)

gulp.task 'requirejs', ->
  rjs
    baseUrl: "#{application.publicDir}/scripts"
    mainConfigFile: "#{application.publicDir}/scripts/config.js"
    out: '#{application.productionDir}/application.js'
    preserveLicenseComments: false
    findNestedDependencies: true
    wrapShim: true
    include: ['../../bower_components/almond/almond', 'main']
    optimize: 'uglify2'
    uglify2:
      output:
        beautify: false
      compress:
        global_defs:
          DEBUG: false

gulp.task 'test', ['scripts'], ->
  gulp.run('karma')

gulp.task 'build', ['clean'], ->
  gulp.run(
    'copy'
    'jsonlint'
    'templates'
    'stylesheets'
    'scripts'
    'connect'
    'grunt-mocks'
  )

gulp.task 'watch', ->
  gulp.watch("#{application.appDir}/scripts/**/*.coffee", ['scripts'])
  gulp.watch("#{application.appDir}/stylesheets/**/*.styl", ['stylesheets'])
  gulp.watch("#{application.appDir}/templates/**/*.jade", ['templates'])

gulp.task 'default', ['build', 'watch']
