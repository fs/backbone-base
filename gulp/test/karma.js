import gulp from 'gulp';
import karma from 'karma';
import babelify from 'babelify';
import config from '../config';

gulp.task('karma', () => {
  const karmaServer = new karma.Server({
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
    runnerPort: config.test.port,
    singleRun: true,
    browsers: ['PhantomJS'],
    files: [
      'vendor/**/*.js',
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
      'karma-chrome-launcher',
      'karma-phantomjs-launcher'
    ],
    browserify: {
      cache: {},
      packageCache: {},
      fullPaths: true,
      debug: config.isDevelopment,
      paths: [config.appDir],
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
  });

  return karmaServer.start();
});
