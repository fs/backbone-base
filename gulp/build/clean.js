import gulp from 'gulp';
import del from 'del';
import config from '../config';

gulp.task('clean', (callback) => del([config.distDir], callback));

gulp.task('clean-logs', (callback) => del([
  'npm-debug.log',
  'phantomjsdriver.log'
], callback));
