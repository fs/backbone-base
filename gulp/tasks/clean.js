import gulp from 'gulp';
import del from 'del';
import config from '../config';

gulp.task('clean', (cb) => del([config.publicDir], cb));
gulp.task('clean-screenshots', (cb) => del([`${config.testDir}/features/screenshots`], cb));
