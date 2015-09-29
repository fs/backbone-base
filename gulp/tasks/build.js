import gulp from 'gulp';
import runSequence from 'run-sequence';

gulp.task('build', () => {
  runSequence(
    'clean',
    [
      'copy',
      'templates',
      'stylesheets',
      'replace',
      'jshint',
      'jsonlint'
    ],
    'browserify',
    'server',
    'watch'
  );
});
