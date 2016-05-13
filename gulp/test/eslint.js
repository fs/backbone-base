import gulp from 'gulp';
import eslint from 'gulp-eslint';
import config from '../config';
import eslintConfig from '../../config/eslint';

gulp.task('eslint', () => {
  return gulp.src([
    `${config.appDir}/src/**/*.js`,
    `${config.gulpDir}/**/*.js`,
    `${config.testDir}/**/*.js`,
    `!${config.appDir}/lib/**/*.js`
  ])
    .pipe(eslint(eslintConfig))
    .pipe(eslint.format())
    .pipe(eslint.failAfterError());
});
