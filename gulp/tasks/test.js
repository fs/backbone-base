import gulp from 'gulp';
import runSequence from 'run-sequence';
import config from '../config';

gulp.task('test', (callback) => {
  const tests = config.isTest ? ['karma'] : ['e2e', 'karma'];
  const params = [
    [ 'jshint', 'jsonlint' ]
  ];

  runSequence(...params.concat(tests), callback);
});
