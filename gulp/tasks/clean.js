import gulp from 'gulp';
import del from 'del';
import config from '../config';

gulp.task('clean', function(cb) {
  return del([config.publicDir], cb);
});

gulp.task('clean-screenshots', function(cb) {
  return del([`${config.testDir}/features/screenshots`], cb);
});
