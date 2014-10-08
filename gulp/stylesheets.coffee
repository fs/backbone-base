gulp = require('gulp')
config = require('./config')
stylus = require('gulp-stylus')
cssimport = require('gulp-cssimport')
concat = require('gulp-concat')
livereload = require('gulp-livereload')

module.exports = ->
  gulp.src("#{config.appDir}/stylesheets/**/*.styl")
    .pipe(stylus(linenos: true))
    .pipe(concat('style.css'))
    .pipe(cssimport())
    .pipe(gulp.dest("#{config.publicDir}/stylesheets/"))
    # .pipe(livereload())
