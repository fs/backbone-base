import yargs from 'yargs';
import configParser from './modules/config_parser';

const argv = yargs.argv;
const env = (argv.env) ? process.env.NODE_ENV || argv.env : 'development';
const mode = (argv.mode) ? process.env.MODE || argv.mode : 'mock';

const config = configParser(env);
const gulpConfig = {
  env,
  mode,
  appDir: 'app',
  publicDir: 'public',
  testDir: 'specs',
  mocksDir: 'mocks',
  get isDevelopment() {
    return this.env === 'development';
  }
};

export default Object.assign(gulpConfig, config);
