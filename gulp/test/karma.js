import gulp from 'gulp';
import karma from 'karma';
import karmaConfig from '../../config/karma.js';

gulp.task('karma', (callback) => new karma.Server(karmaConfig, callback).start());
