var fs = require('fs');
var gulp = require('gulp');
var replace = require('gulp-replace-task');
var config = require('../config');

gulp.task('replace', function() {
  var env = 'development';
  var settings = {};
  var patterns = [];

  settings = JSON.parse(fs.readFileSync(config.appDir + "/config/environments/" + env + ".json", 'utf8'));
  settings['env'] = env;

  for (var settingName in settings) {
    patterns.push({
      match: settingName,
      replacement: settings[settingName]
    });
  };

  return gulp.src(config.appDir + "/config/config.js")
    .pipe(replace({patterns: patterns}))
    .pipe(gulp.dest(config.appDir + "/scripts"));
});
