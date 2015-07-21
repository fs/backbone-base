import gulp from 'gulp';
import plumber from 'gulp-plumber';
import config from '../config';

gulp.task('copy', function() {
  return gulp.src([
    `${config.appDir}/images/**/*`
  ], { base: config.appDir })
    .pipe(plumber())
    .pipe(gulp.dest(config.publicDir));
});
