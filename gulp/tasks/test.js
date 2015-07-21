import gulp from 'gulp';
import runSequence from 'run-sequence';

gulp.task('test', function() {
  runSequence(['karma', 'e2e']);
});
