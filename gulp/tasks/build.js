import gulp from 'gulp';
import runSequence from 'run-sequence';

gulp.task('build', function() {
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
