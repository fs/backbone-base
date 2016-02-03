import gulp from 'gulp';
import mocha from 'gulp-mocha';
import config from '../config';

gulp.task('e2e', ['clean-logs', 'build', 'server'], () => {
  return gulp.src(`${config.testDir}/**/*_feature.js`)
    .pipe(mocha({
      reporter: 'dot',
      timeout: 5000
    }))
    .once('error', () => { process.exit(1); });
});
