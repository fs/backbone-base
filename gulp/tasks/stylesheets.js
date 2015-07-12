var gulp = require('gulp');
var stylus = require('gulp-stylus');
var cssimport = require('gulp-cssimport');
var autoprefixer = require('autoprefixer-stylus');
var jeet = require('jeet');
var plumber = require('gulp-plumber');
var notify = require('gulp-notify');
var config = require('../config');

gulp.task('stylesheets', function() {
  return gulp.src(config.appDir + '/stylesheets/application.styl')
    .pipe(plumber())
    .pipe(stylus({
      linenos: true,
      use: [
        autoprefixer({ browsers: 'last 2 versions' }),
        jeet()
      ]
    }).on('error', notify.onError()))
    .pipe(cssimport())
    .pipe(gulp.dest(config.publicDir));
});
