import fs from 'fs';
import gulp from 'gulp';
import replace from 'gulp-replace-task';
import config from '../config';

gulp.task('replace', function() {
  let settings = {};
  let patterns = [];

  settings = JSON.parse(fs.readFileSync(`${config.appDir}/config/environments/${config.env}.json`, 'utf8'));
  settings['env'] = config.env;

  for (let settingName in settings) {
    patterns.push({
      match: settingName,
      replacement: settings[settingName]
    });
  };

  return gulp.src(`${config.appDir}/config/config.js`)
    .pipe(replace({ patterns }))
    .pipe(gulp.dest(`${config.appDir}/scripts`));
});
