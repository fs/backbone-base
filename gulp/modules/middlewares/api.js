import proxyMiddleware from 'http-proxy-middleware';
import historyApiFallback from 'connect-history-api-fallback';
import config from '../../config';

export default () => {
  if (config.mode === 'api') {
    return [
      proxyMiddleware(config.api.path, { target: config.api.targer }),
      historyApiFallback
    ];
  }
}
