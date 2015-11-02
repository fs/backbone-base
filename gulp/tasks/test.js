import gulp from 'gulp';
import runSequence from 'run-sequence';

gulp.task('test', (callback) => {
  runSequence(
    [
      'jshint',
      'jsonlint',
      'karma',
      'e2e',
    ],
    callback
  );
});
