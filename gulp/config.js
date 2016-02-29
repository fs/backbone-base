import dotenv from 'dotenv';
import configParser from './modules/config_parser';

dotenv.load();

const gulpConfig = {
  env: process.env.NODE_ENV,
  mode: process.env.MODE,
  appDir: 'app',
  distDir: 'dist',
  testDir: 'specs',
  mocksDir: 'mocks',
  configDir: 'config',
  gulpDir: 'gulp',
  [process.env.NODE_ENV]: true
};
const config = configParser(gulpConfig.env);

export default Object.assign(gulpConfig, config);
