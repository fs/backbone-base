import configParser from './modules/config_parser';

const gulpConfig = {
  env: process.env.NODE_ENV || 'development',
  mode: process.env.MODE || 'mock',
  appDir: 'app',
  publicDir: 'public',
  testDir: 'specs',
  mocksDir: 'mocks',
  get isDevelopment() {
    return this.env === 'development';
  }
};
const config = configParser(gulpConfig.env);

export default Object.assign(gulpConfig, config);
