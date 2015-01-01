gulp = require('gulp')
plumber = require('gulp-plumber')
source = require('vinyl-source-stream')
buffer = require('vinyl-buffer')
browserify = require('browserify')
remapify = require('remapify')
watchify = require('watchify')
notify = require('gulp-notify')
config = require('../config')

gulp.task 'browserify', ->
  debug = config.env is 'development'

  bundler = browserify(
    cache: {}
    packageCache: {}
    fullPaths: true
    debug: debug
    extensions: ['.coffee', '.js', '.jade']
    entries: "./#{config.appDir}/scripts/main.coffee"
  )

  bundler.plugin(remapify, [
    src: '**/*.coffee'
    expose: 'scripts'
    cwd: "./#{config.appDir}/scripts"
  ])

  bundler.plugin(remapify, [
    src: '**/*.jade'
    expose: 'templates'
    cwd: "./#{config.appDir}/templates"
  ])

  bundler.transform('browserify-shim')
  bundler.transform('coffeeify')
  bundler.transform('jadeify')
  bundler.transform('uglifyify') if config.env isnt 'development'

  bundle = ->
    bundler.bundle()
      .on('error', notify.onError())
      .pipe(source('application.js'))
      .pipe(buffer())
      .pipe(gulp.dest(config.publicDir))

  watchify(bundler).on('update', bundle)

  bundle()
