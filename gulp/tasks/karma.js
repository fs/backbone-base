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
      'bower_components/jquery/dist/jquery.js',
      'bower_components/underscore/underscore.js',
      'bower_components/backbone/backbone.js',
      'bower_components/backbone-route-filter/backbone-route-filter.js',
      'bower_components/backbone.stickit/backbone.stickit.js',
      'bower_components/backbone-validation/dist/backbone-validation.js',
      'bower_components/marionette/lib/backbone.marionette.js',
      'bower_components/bootstrap/dist/js/bootstrap.js',
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
      paths: ["./" + config.appDir],
      transform: [
        'browserify-shim'
      ],
      prebundle: function(bundle) {
        bundle.transform(babelify.configure({
          ignore: [
            'bower_components',
            'vendor/scripts'
          ],
          sourceMapRelative: "./" + config.appDir
        }));
      }
    },
    client: {
      mocha: {
        ui: 'bdd'
      }
    }
  });
});
