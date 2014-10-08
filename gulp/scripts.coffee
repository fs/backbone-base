gulp = require('gulp')
gutil = require('gulp-util')
config = require('./config')
coffee = require('gulp-coffee')
coffeelint = require('gulp-coffeelint')
jsonlint = require('gulp-jsonlint')
livereload = require('gulp-livereload')

module.exports = ->
  gulp.src('mocks/**/*.json')
    .pipe(jsonlint())
    .pipe(jsonlint.reporter())
  gulp.src("#{config.appDir}/scripts/**/*.coffee")
    .pipe(coffeelint())
    .pipe(coffeelint.reporter())
    .pipe(coffee().on('error', gutil.log))
    .pipe(gulp.dest("#{config.publicDir}/scripts/"))
    # .pipe(livereload())