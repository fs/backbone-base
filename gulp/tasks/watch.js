import gulp from 'gulp';
import config from '../config';

gulp.task('watch', function() {
  gulp.watch(`${config.appDir}/stylesheets/**/*.css`, ['stylesheets']);
  gulp.watch(`${config.appDir}/*.jade`, ['templates']);
});
