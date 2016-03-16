import gulp from 'gulp';
import runSequence from 'run-sequence';
import config from '../config';

gulp.task('build', (callback) => {
  runSequence(
    'clean',
    'stylesheets-sort',
    [
      'copy',
      'templates',
      'stylesheets',
      'replace'
    ],
    'browserify',
    callback
  );
});
