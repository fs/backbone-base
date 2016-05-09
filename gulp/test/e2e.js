import gulp from 'gulp';
import shell from 'gulp-shell';
import runSequence from 'run-sequence';
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
  gulp.src(`${config.testDir}/**/*_feature.js`, { read: false })
    .pipe(shell('mocha --compilers=js:babel-core/register --reporter=dot --timeout=5000 --colors <%= file.path %>'))
    .on('end', process.exit);
});
