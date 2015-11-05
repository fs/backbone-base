import gulp from 'gulp';
import karma from 'karma';
import babelify from 'babelify';
import config from '../config';

gulp.task('karma', () => {
  let karmaServer = new karma.Server({
    basePath: process.cwd(),
    frameworks: [
      'mocha',
      'browserify',
      'chai',
      'sinon'
    ],
    runnerPort: config.test.port,
    singleRun: true,
    browsers: ['PhantomJS'],
    files: [
      'node_modules/babel-core/polyfill.js',
      'node_modules/jquery/dist/jquery.js',
      'node_modules/underscore/underscore.js',
      'node_modules/backbone/backbone.js',
      'node_modules/backbone-route-filter/backbone-route-filter.js',
      'node_modules/backbone.stickit/backbone.stickit.js',
      'node_modules/backbone-validation/dist/backbone-validation.js',
      'node_modules/backbone.marionette/lib/backbone.marionette.js',
      'node_modules/bootstrap/dist/js/bootstrap.js',
      'vendor/**/*.js',
      'specs/**/*_spec.js'
    ],
    reporters: ['dots'],
    colors: true,
    preprocessors: {
      'node_modules/babel-core/polyfill.js': ['browserify'],
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
      paths: [`./${config.appDir}`],
      transform: [
        'browserify-shim'
      ],
      configure: (bundle) => {
        bundle.on('prebundle', () => {
          bundle.transform(babelify.configure({
            presets: ['es2015', 'stage-1'],
            sourceMapRelative: `./${config.appDir}`
          }));
        })
      }
    },
    client: {
      mocha: { ui: 'bdd' }
    }
  });

  return karmaServer.start();
});
