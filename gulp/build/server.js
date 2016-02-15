import gulp from 'gulp';
import browserSync from 'browser-sync';
import connect from 'connect';
import serveStatic from 'serve-static';
import config from '../config';
import middlewaresStack from '../modules/middlewares_stack';
import apiMiddleware from '../modules/middlewares/api';
import mockMiddleware from '../modules/middlewares/mock';

gulp.task('server', () => {
  const port = process.env.PORT;
  const middlewares = apiMiddleware() || mockMiddleware();

  if (config.isDevelopment) {
    const server = browserSync.create();

    server.init({
      port,
      open: false,
      notify: false,
      server: {
        baseDir: config.publicDir,
        middleware(req, res, next) {
          middlewaresStack(middlewares, req, res, next);
        }
      },
      files: [`${config.publicDir}/**/*`]
    });
  }
  else {
    const server = connect();

    server.use((req, res, next) => middlewaresStack(middlewares, req, res, next));
    server.use(serveStatic(config.publicDir));
    server.listen(port);
    console.log(`Listening on 0.0.0.0:${port}`);
  }
});
