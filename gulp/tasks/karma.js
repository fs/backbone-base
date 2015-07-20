var gulp = require('gulp');
var karma = require('karma');
var babelify = require('babelify');
var config = require('../config');

gulp.task('karma', function() {
  return karma.server.start({
    basePath: process.cwd(),
    frameworks: [
      'mocha',
      'browserify',
      'chai',
      'sinon'
    ],
    runnerPort: config.ports.test,
    singleRun: true,
    browsers: ['PhantomJS'],
    files: [
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
      debug: true,
      paths: ['./' + config.appDir],
      transform: [
        'browserify-shim'
      ],
      prebundle: function(bundle) {
        bundle.transform(babelify.configure({ sourceMapRelative: './' + config.appDir }));
      }
    },
    client: {
      mocha: {
        ui: 'bdd'
      }
    }
  });
});
