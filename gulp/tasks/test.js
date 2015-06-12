var gulp = require('gulp');
var runSequence = require('run-sequence');

gulp.task('test', function() {
  runSequence(['karma', 'e2e']);
});
