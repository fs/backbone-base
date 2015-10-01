import gulp from 'gulp';
import browserSync from 'browser-sync';
import historyApiFallback from 'connect-history-api-fallback';
import prism from 'connect-prism';
import proxyMiddleware from 'http-proxy-middleware';
import config from '../config';

gulp.task('server', () => {
  let middleware = [];

  if (config.mode === 'api') {
    middleware = [
      proxyMiddleware(config.apiPath, {
        target: `http://${config.hosts.development}:${config.ports.development.api}`
      }),
      historyApiFallback
    ];
  }

  if (config.mode === 'mock') {
    prism.create({
      name: 'serve',
      mode: 'mock',
      context: config.apiPath,
      host: config.hosts.development,
      port: config.ports.development.mocks,
      delay: 0,
      rewrite: {},
      mockFilenameGenerator(config, req) {
        return `${req._parsedUrl.pathname.replace(/^\//, '')}_${req.method}.json`;
      }
    });

    middleware = [
      prism.middleware,
      historyApiFallback
    ];
  }

  browserSync({
    port: config.ports.development.server,
    open: false,
    notify: false,
    server: {
      middleware,
      baseDir: config.publicDir,
    },
    files: [
      `${config.publicDir}/**`,
      `!${config.publicDir}/**.map`
    ]
  });
});
