import gulp from 'gulp';
import jsonlint from 'gulp-jsonlint';
import config from '../config';

gulp.task('jsonlint', () => {
  return gulp.src([
    `${config.configDir}/*.json`,
    `${config.mocksDir}/**/*.json`
  ])
    .pipe(jsonlint())
    .pipe(jsonlint.reporter());
});
