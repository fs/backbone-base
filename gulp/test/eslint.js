import gulp from 'gulp';
import eslint from 'gulp-eslint';
import config from '../config';

gulp.task('eslint', () => {
  return gulp.src([
    `${config.appDir}/src/**/*.js`,
    `${config.gulpDir}/**/*.js`,
    `${config.testDir}/**/*.js`
  ])
    .pipe(eslint(`${config.configDir}/eslint.js`))
    .pipe(eslint.format())
    .pipe(eslint.failAfterError());
});
