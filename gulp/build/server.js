import gulp from 'gulp';
import config from '../config';
import developmentServer from '../modules/server/development';
import productionServer from '../modules/server/production';

gulp.task('server', () => {
  if (config.development) {
    gulp.watch(`${config.appDir}/images/**/*`, ['copy']);
    gulp.watch(`${config.appDir}/stylesheets/**/*.css`, ['stylesheets']);
    gulp.watch(`${config.appDir}/*.jade`, ['templates']);
    developmentServer();
  }
  else {
    productionServer();
  }
});
