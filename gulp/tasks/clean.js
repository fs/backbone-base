var gulp = require('gulp');
var del = require('del');
var config = require('../config');

gulp.task('clean', function(cb) {
  return del([config.publicDir], cb);
});

gulp.task('clean-screenshots', function(cb) {
  return del([config.testDir + '/features/screenshots'], cb);
});
