var gulp   = require('gulp');
var jshint = require('gulp-jshint');
var config = require('../config');

gulp.task('jshint', function() {
  return gulp.src(config.appDir + '/scripts/**/*.js')
    .pipe(jshint({
      esnext: true,
      eqeqeq: true,
      forin: true,
      maxcomplexity: false,
      maxdepth: 2
    }))
    .pipe(jshint.reporter());
});
