var gulp = require('gulp');
var plumber = require('gulp-plumber');
var postcss = require('gulp-postcss');
var notify = require('gulp-notify');
var config = require('../config');

gulp.task('stylesheets', function() {
  var autoprefixer = require('autoprefixer-core');
  var pxtorem = require('postcss-pxtorem');
  var processors = [
    require('postcss-import'),
    require('postcss-mixins'),
    require('postcss-nested'),
    require('postcss-simple-vars'),
    require('postcss-color-function'),
    autoprefixer({ browsers: ['last 2 versions'] }),
    pxtorem({
      root_value: 13,
      replace: false
    })
  ];

  return gulp.src(config.appDir + '/stylesheets/application.css')
    .pipe(plumber())
    .pipe(postcss(processors))
    .on('error', notify.onError())
    .pipe(gulp.dest(config.publicDir));
})
