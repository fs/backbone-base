import gulp from 'gulp';
import browserSync from 'browser-sync';
import config from '../config';
import apiMiddleware from '../modules/middlewares/api';
import mockMiddleware from '../modules/middlewares/mock';

gulp.task('server', () => {
  browserSync({
    port: config.server.port,
    open: false,
    notify: false,
    server: {
      middleware: apiMiddleware() || mockMiddleware(),
      baseDir: config.publicDir,
    },
    files: [
      `${config.publicDir}/**`,
      `!${config.publicDir}/**.map`
    ]
  });
});
