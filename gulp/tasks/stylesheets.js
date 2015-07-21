import gulp from 'gulp';
import stylus from 'gulp-stylus';
import cssimport from 'gulp-cssimport';
import autoprefixer from 'autoprefixer-stylus';
import jeet from 'jeet';
import plumber from 'gulp-plumber';
import notify from 'gulp-notify';
import config from '../config';

gulp.task('stylesheets', function() {
  return gulp.src(`${config.appDir}/stylesheets/application.styl`)
    .pipe(plumber())
    .pipe(stylus({
      linenos: true,
      use: [
        autoprefixer({ browsers: 'last 2 versions' }),
        jeet()
      ]
    }).on('error', notify.onError()))
    .pipe(cssimport())
    .pipe(gulp.dest(config.publicDir));
});
