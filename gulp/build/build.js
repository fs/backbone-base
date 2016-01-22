import gulp from 'gulp';
import runSequence from 'run-sequence';
import config from '../config';

gulp.task('build', (callback) => {
  if (config.isDevelopment) {
    runSequence(
      'clean',
      [
        'copy',
        'templates',
        'stylesheets',
        'replace'
      ],
      'browserify',
      'watch',
      callback
    );
  }
  else {
    runSequence(
      [
        'copy',
        'templates',
        'stylesheets',
        'replace'
      ],
      'browserify',
      callback
    );
  }
});
