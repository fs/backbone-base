import gulp from 'gulp';
import runSequence from 'run-sequence';
import mocha from 'gulp-mocha';
import config from '../config';

gulp.task('prepare-e2e', (callback) => {
  runSequence(
    'clean-logs',
    'build',
    'server',
    callback
  );
});

gulp.task('e2e', ['prepare-e2e'], () => {
  return gulp.src(`${config.testDir}/**/*_feature.js`)
    .pipe(mocha({
      reporter: 'dot',
      timeout: 5000
    }))
    .once('error', () => { process.exit(1); });
});
