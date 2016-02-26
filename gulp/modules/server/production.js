import connect from 'connect';
import serveStatic from 'serve-static';
import config from '../../config';
import middlewaresStack from '../middlewares_stack';
import apiMiddleware from '../middlewares/api';
import mockMiddleware from '../middlewares/mock';

export default () => {
  const port = process.env.PORT;
  const middlewares = apiMiddleware() || mockMiddleware();
  const server = connect();

  server.use((req, res, next) => middlewaresStack(middlewares, req, res, next));
  server.use(serveStatic(config.distDir));
  server.listen(port);
  console.log(`Listening on 0.0.0.0:${port}`);
};
