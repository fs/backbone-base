import gulp from 'gulp';
import shell from 'gulp-shell';
import config from '../config';

const CASPER_COMMAND = 'mocha-casperjs \
  --chai-path=node_modules/chai \
  --casper-chai-path=node_modules/casper-chai \
  --viewport-width=1280 \
  --viewport-height=800 \
  <%= file.path %> \
';

gulp.task('e2e', ['clean-screenshots'], function() {
  return gulp.src(`${config.testDir}/features/**/*_feature.js`, { read: false })
    .pipe(shell(CASPER_COMMAND));
});
