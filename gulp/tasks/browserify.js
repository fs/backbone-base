var gulp = require('gulp');
var rename = require('gulp-rename');
var browserify = require('browserify');
var transform = require('vinyl-transform');
var jadeify = require('jadeify');
var babelify = require('babelify');
var watchify = require('watchify');
var notify = require('gulp-notify');
var config = require('../config');
var entryPoint = './' + config.appDir + '/scripts/main.js';

gulp.task('browserify', function() {
  var bundler = browserify({
    cache: {},
    packageCache: {},
    fullPaths: true,
    debug: true,
    extensions: ['.jade', '.js'],
    entries: entryPoint,
    paths: ['./' + config.appDir]
  })
  .transform(jadeify)
  .transform(babelify.configure({ sourceMapRelative: './' + config.appDir }));

  function bundle() {
    var bundleTransform = transform(function(filename) {
      return bundler.bundle();
    });

    return gulp.src(entryPoint)
      .pipe(bundleTransform)
      .on('error', notify.onError())
      .pipe(rename({ basename: 'application' }))
      .pipe(gulp.dest(config.publicDir))
  };

  watchify(bundler).on('update', bundle);

  return bundle();
});
