import requireDir from 'require-dir';
import config from './gulp/config';

requireDir('./gulp/build');

if (config.development || config.test) {
  requireDir('./gulp/test');
}
