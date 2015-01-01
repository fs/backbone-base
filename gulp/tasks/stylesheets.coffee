gulp = require('gulp')
gulpif = require('gulp-if')
stylus = require('gulp-stylus')
cssimport = require('gulp-cssimport')
minifycss = require('gulp-minify-css')
autoprefixer = require('autoprefixer-stylus')
jeet = require('jeet')
plumber = require('gulp-plumber')
notify = require('gulp-notify')
config = require('../config')

gulp.task 'stylesheets', ->
  debug = config.env is 'development'

  gulp.src("#{config.appDir}/stylesheets/application.styl")
    .pipe(plumber())
    .pipe(
      stylus(
        linenos: debug
        use: [
          autoprefixer(browsers: 'last 2 versions')
          jeet()
        ]
      ).on('error', notify.onError())
    )
    .pipe(cssimport())
    .pipe(gulpif(config.env isnt 'development', minifycss()))
    .pipe(gulp.dest(config.publicDir))
