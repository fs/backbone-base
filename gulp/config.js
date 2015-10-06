import yargs from 'yargs';
import configParser from './modules/config_parser';

const argv = yargs.argv;
const env = (argv.env) ? argv.env : 'development';
const mode = (argv.mode) ? argv.mode : 'mock';

const serverConfig = configParser(`server/${env}`);
const gulpConfig = {
  env,
  mode,
  appDir: 'app',
  publicDir: 'public',
  testDir: 'specs',
  mocksDir: 'mocks',
  get debug() {
    return this.env === 'development';
  }
};

export default Object.assign(gulpConfig, serverConfig);
