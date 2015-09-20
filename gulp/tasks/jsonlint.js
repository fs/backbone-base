import gulp from 'gulp';
import jsonlint from 'gulp-jsonlint';
import config from '../config';

gulp.task('jsonlint', () => {
  gulp.src([
    `${config.mocksDir}/**/*.json`,
    `${config.appDir}/config/environments/*.json`
  ])
    .pipe(jsonlint())
    .pipe(jsonlint.reporter());
});
