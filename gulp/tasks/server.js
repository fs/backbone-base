var gulp = require('gulp');
var browserSync = require('browser-sync');
var historyApiFallback = require('connect-history-api-fallback');
var prism = require('connect-prism');
var config = require('../config');

gulp.task('server', function() {
  prism.create({
    name: 'serve',
    mode: 'mock',
    context: '/api',
    host: 'localhost',
    port: 8001,
    delay: 0,
    rewrite: {},
    mockFilenameGenerator: function(config, req) {
      return req._parsedUrl.pathname.replace(/^\//, '') + '_' + req.method + '.json';
    }
  });

  browserSync({
    port: config.ports.server,
    open: false,
    notify: false,
    server: {
      baseDir: config.publicDir,
      middleware: [
        prism.middleware,
        historyApiFallback
      ]
    },
    files: [
      config.publicDir + '/**',
      '!' + config.publicDir + '/**.map'
    ]
  });
});
