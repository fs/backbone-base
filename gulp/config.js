import yargs from 'yargs';

const argv = require('yargs').argv;

export default {
  appDir: 'app',
  publicDir: 'public',
  testDir: 'specs',
  mocksDir: 'mocks',
  apiPath: '/v1',
  hosts: {
    development: 'localhost'
  },
  ports: {
    development: {
      server: 8000,
      mocks: 8001,
      api: 3000
    },
    test: 9999
  },
  get env() {
    return (argv.env) ? argv.env : 'development';
  },
  get mode() {
    return (argv.mode) ? argv.mode : 'mock';
  },
  get debug() {
    return this.env === 'development';
  }
};
