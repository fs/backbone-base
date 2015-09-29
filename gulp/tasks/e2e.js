import gulp from 'gulp';
import shell from 'gulp-shell';
import config from '../config';

const casperCommand = 'mocha-casperjs \
  --chai-path=node_modules/chai \
  --casper-chai-path=node_modules/casper-chai \
  --viewport-width=1280 \
  --viewport-height=800 \
  <%= file.path %> \
';

gulp.task('e2e', ['clean-screenshots'], (cb) => {
  gulp.src(`${config.testDir}/compiled_features/**/*_feature.js`)
    .pipe(shell(casperCommand))
    .on('end', cb);
});
