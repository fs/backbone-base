import gulp from 'gulp';
import connect from 'connect';
import serveStatic from 'serve-static';
import config from '../config';
import middlewaresStack from '../modules/middlewares_stack';
import apiMiddleware from '../modules/middlewares/api';
import mockMiddleware from '../modules/middlewares/mock';

gulp.task('server', () => {
  const server = connect();
  const port = process.env.PORT;
  const middlewares = apiMiddleware() || mockMiddleware();

  server.use((req, res, next) => middlewaresStack(middlewares, req, res, next));
  server.use(serveStatic(config.publicDir));
  server.listen(port);

  console.log(`Listening on 0.0.0.0:${port}`);
});
