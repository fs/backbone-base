import prism from 'connect-prism';
import historyApiFallback from 'connect-history-api-fallback';
import config from '../../config';

export default () => {
  if (config.mode === 'mock') {
    prism.create({
      name: 'serve',
      mode: 'mock',
      context: config.mock.path,
      host: config.mock.host,
      port: config.mock.port,
      delay: 0,
      rewrite: {},
      mockFilenameGenerator(config, req) {
        return `${req._parsedUrl.pathname.replace(/^\//, '')}_${req.method}.json`;
      }
    });

    return [
      prism.middleware,
      historyApiFallback()
    ];
  }
};
