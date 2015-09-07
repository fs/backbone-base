var gulp = require('gulp');
var config = require('../config');

gulp.task('watch', function() {
  gulp.watch(config.appDir + '/stylesheets/**/*.css', ['stylesheets']);
  gulp.watch(config.appDir + '/*.jade', ['templates']);
});
