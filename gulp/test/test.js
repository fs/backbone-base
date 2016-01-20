import gulp from 'gulp';
import runSequence from 'run-sequence';
import config from '../config';

gulp.task('test', (callback) => {
  const tests = config.isTest ? ['karma'] : ['e2e', 'karma'];
  const linters = ['jsonlint', 'eslint', 'stylelint'];
  const params = linters.concat(tests);

  runSequence(params, callback);
});