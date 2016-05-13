import config from '../gulp/config';

export default {
  basePath: process.cwd(),
  frameworks: [
    'mocha',
    'browserify',
    'chai',
    'sinon'
  ],
  client: {
    mocha: { ui: 'bdd' }
  },
  port: config.test.port,
  singleRun: true,
  browsers: ['PhantomJS'],
  files: [
    'node_modules/promise-polyfill/promise.js',
    'app/lib/**/*.js',
    'specs/**/*_spec.js'
  ],
  reporters: ['dots'],
  colors: true,
  preprocessors: {
    'specs/**/*.js': ['browserify']
  },
  plugins: [
    'karma-mocha',
    'karma-chai',
    'karma-sinon',
    'karma-browserify',
    'karma-phantomjs-launcher'
  ],
  browserify: {
    cache: {},
    packageCache: {},
    fullPaths: true,
    debug: config.development,
    paths: [`${config.appDir}/src`],
    transform: [
      [
        'babelify',
        {
          presets: ['es2015'],
          plugins: ['babel-plugin-transform-decorators-legacy']
        }
      ]
    ]
  }
};
