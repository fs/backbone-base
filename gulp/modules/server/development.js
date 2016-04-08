import browserSync from 'browser-sync';
import config from '../../config';
import middlewaresStack from '../middlewares_stack';
import apiMiddleware from '../middlewares/api';
import mockMiddleware from '../middlewares/mock';

export default () => {
  const port = process.env.PORT;
  const middlewares = apiMiddleware() || mockMiddleware();
  const server = browserSync.create();

  server.init({
    port,
    open: false,
    notify: false,
    server: {
      baseDir: config.distDir,
      middleware(req, res, next) {
        middlewaresStack(middlewares, req, res, next);
      }
    },
    files: [
      `${config.distDir}/**/*`,
      `!${config.distDir}/**/*.map`
    ]
  });
};
