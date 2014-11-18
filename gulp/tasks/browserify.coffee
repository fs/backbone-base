gulp = require('gulp')
plumber = require('gulp-plumber')
source = require('vinyl-source-stream')
browserify = require('browserify')
remapify = require('remapify')
watchify = require('watchify')
notify = require('gulp-notify')
config = require('../config')

gulp.task 'browserify', ->
  bundler = browserify(
    cache: {}
    packageCache: {}
    fullPaths: true
    debug: true
    extensions: ['.coffee', '.js', '.jade']
    entries: "./#{config.appDir}/scripts/main.coffee"
  )

  bundler.plugin(remapify, [
    src: '**/*.coffee'
    expose: 'scripts'
    cwd: './app/scripts'
  ])

  bundler.plugin(remapify, [
    src: '**/*.jade'
    expose: 'templates'
    cwd: './app/templates'
  ])

  bundle = ->
    bundler
      .transform('browserify-shim')
      .transform('coffeeify')
      .transform('jadeify')
      .bundle()
      .pipe(plumber())
      .pipe(source('application.js'))
      .pipe(gulp.dest(config.publicDir))

  watchify(bundler)
    .on('error', notify.onError)
    .on('update', ->
      bundler
        .bundle()
        .pipe(plumber())
        .pipe(source('application.js'))
        .pipe(gulp.dest(config.publicDir))
    )

  bundle()
