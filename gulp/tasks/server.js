import gulp from 'gulp';
import browserSync from 'browser-sync';
import historyApiFallback from 'connect-history-api-fallback';
import prism from 'connect-prism';
import config from '../config';

gulp.task('server', () => {
  prism.create({
    name: 'serve',
    mode: 'mock',
    context: '/api',
    host: 'localhost',
    port: 8001,
    delay: 0,
    rewrite: {},
    mockFilenameGenerator(config, req) {
      return `${req._parsedUrl.pathname.replace(/^\//, '')}_${req.method}.json`;
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
      `${config.publicDir}/**`,
      `!${config.publicDir}/**.map`
    ]
  });
});
