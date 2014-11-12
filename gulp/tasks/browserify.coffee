gulp = require('gulp')
plumber = require('gulp-plumber')
source = require('vinyl-source-stream')
browserify = require('browserify')
watchify = require('watchify')
notify = require('gulp-notify')
config = require('../config')

gulp.task 'browserify', ->
  bundler = browserify(
    cache: {}
    packageCache: {}
    fullPaths: true
    debug: true
    extensions: ['.js', '.coffee', '.jade']
    entries: "./#{config.appDir}/scripts/main.coffee"
  )

  bundle = ->
    bundler
      .bundle()
      .pipe(plumber())
      .pipe(source('application.js'))
      .pipe(gulp.dest("#{config.publicDir}"));

  bundler = watchify(bundler)
  bundler
    .on('error', notify.onError())
    .on('update', bundle)
  bundle()
