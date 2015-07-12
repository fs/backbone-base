var gulp = require('gulp');
var jsonlint = require('gulp-jsonlint');
var config = require('../config');

gulp.task('jsonlint', function() {
  return gulp.src([config.mocksDir + '/**/*.json', config.appDir + '/config/environments/*.json'])
    .pipe(jsonlint())
    .pipe(jsonlint.reporter());
});
