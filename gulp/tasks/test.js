import gulp from 'gulp';
import runSequence from 'run-sequence';

gulp.task('test', () => runSequence(['karma', 'e2e']));
