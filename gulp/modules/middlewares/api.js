import historyApiFallback from 'connect-history-api-fallback';
import config from '../../config';

export default () => {
  if (config.mode === 'api') {
    return historyApiFallback();
  }
};
