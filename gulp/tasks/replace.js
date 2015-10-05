import gulp from 'gulp';
import replace from 'gulp-replace-task';
import config from '../config';
import configParser from '../modules/config_parser';

gulp.task('replace', () => {
  let patterns = [];
  let settings = configParser(`application/${config.env}`);

  for (let settingName in settings) {
    patterns.push({
      match: settingName,
      replacement: settings[settingName]
    });
  };

  gulp.src('config/application/config.js')
    .pipe(replace({ patterns }))
    .pipe(gulp.dest(`${config.appDir}/scripts`));
});
