import gulp from 'gulp';
import replace from 'gulp-replace-task';
import config from '../config';
import configParser from '../modules/config_parser';

gulp.task('replace', () => {
  const patterns = [];
  const settings = configParser(config.env);

  for (const settingName in settings.app) {
    patterns.push({
      match: settingName,
      replacement: settings.app[settingName]
    });
  };

  patterns.push({
    match: 'apiPath',
    replacement: `${config[config.mode].target}${config[config.mode].path}`
  });

  return gulp.src('config/config.js')
    .pipe(replace({ patterns }))
    .pipe(gulp.dest(`${config.appDir}/src`));
});
