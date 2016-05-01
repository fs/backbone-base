import gulp from 'gulp';
import plumber from 'gulp-plumber';
import pug from 'gulp-pug';
import notify from 'gulp-notify';
import config from '../config';

gulp.task('templates', () => {
  return gulp.src(`${config.appDir}/*.pug`)
    .pipe(plumber())
    .pipe(pug({
      pretty: true,
      data: {}
    }).on('error', notify.onError()))
    .pipe(gulp.dest(config.distDir));
});
