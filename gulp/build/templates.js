import gulp from 'gulp';
import plumber from 'gulp-plumber';
import jade from 'gulp-jade';
import notify from 'gulp-notify';
import config from '../config';

gulp.task('templates', () => {
  return gulp.src(`${config.appDir}/*.jade`)
    .pipe(plumber())
    .pipe(jade({
      pretty: true,
      data: {}
    }).on('error', notify.onError()))
    .pipe(gulp.dest(config.distDir));
});
