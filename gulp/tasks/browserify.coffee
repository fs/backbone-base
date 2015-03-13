gulp = require('gulp')
rename = require('gulp-rename')
transform = require('vinyl-transform')
browserify = require('browserify')
browserifyShim = require('browserify-shim')
jadeify = require('jadeify')
coffeeify = require('coffeeify')
watchify = require('watchify')
notify = require('gulp-notify')
config = require('../config')
entryPoint = "./#{config.appDir}/scripts/main.coffee"

gulp.task 'browserify', ->
  bundler = browserify(
    cache: {}
    packageCache: {}
    fullPaths: true
    debug: true
    extensions: ['.coffee', '.js', '.jade']
    paths: ["./#{config.appDir}"]
    entries: entryPoint
  )
  .transform(browserifyShim)
  .transform(jadeify)
  .transform(coffeeify)

  bundle = ->
    bundle = transform (filename) ->
      bundler.bundle()

    gulp.src(entryPoint)
      .pipe(bundle)
      .on('error', notify.onError())
      .pipe(rename('application.js'))
      .pipe(gulp.dest(config.publicDir))

  watchify(bundler).on('update', bundle)

  bundle()
