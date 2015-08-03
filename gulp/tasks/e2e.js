import gulp from 'gulp';
import babel from 'gulp-babel';
import shell from 'gulp-shell';
import config from '../config';

const CASPER_COMMAND = 'mocha-casperjs \
  --chai-path=node_modules/chai \
  --casper-chai-path=node_modules/casper-chai \
  --viewport-width=1280 \
  --viewport-height=800 \
  <%= file.path %> \
';

gulp.task('e2e', ['clean-screenshots'], function(cb) {
  gulp.src(`${config.testDir}/features/**/*.js`)
    .pipe(babel({ blacklist: ['strict'] }))
    .pipe(gulp.dest(`${config.testDir}/compiled_features`))
    .on('end', cb);

  gulp.src(`${config.testDir}/compiled_features/**/*_feature.js`)
    .pipe(shell(CASPER_COMMAND))
    .on('end', cb);
});
