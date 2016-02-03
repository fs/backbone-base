import gulp from 'gulp';
import runSequence from 'run-sequence';

gulp.task('test', (callback) => {
  runSequence(
    'e2e',
    'karma',
    [
      'jsonlint',
      'eslint',
      'stylelint'
    ],
    callback
  );
});
