import gulp from 'gulp';
import rename from 'gulp-rename';
import browserify from 'browserify';
import source from 'vinyl-source-stream';
import jadeify from 'jadeify';
import babelify from 'babelify';
import watchify from 'watchify';
import minifyify from 'minifyify';
import notify from 'gulp-notify';
import config from '../config';

const entryPoint = `./${config.appDir}/src/main.js`;

gulp.task('browserify', () => {
  const bundler = browserify({
    cache: {},
    packageCache: {},
    fullPaths: true,
    debug: config.isDevelopment,
    extensions: ['.jade', '.js'],
    entries: entryPoint,
    paths: [`${config.appDir}/src`]
  })
  .transform(jadeify)
  .transform(babelify.configure({
    presets: ['es2015'],
    plugins: ['transform-decorators-legacy'],
    sourceMapRelative: config.appDir
  }));

  const bundle = () => {
    const bundleStream = bundler.bundle();

    return bundleStream
      .on('error', notify.onError())
      .pipe(source(entryPoint))
      .pipe(rename('application.js'))
      .pipe(gulp.dest(config.distDir));
  };

  if (config.isDevelopment) {
    watchify(bundler).on('update', bundle);
  }
  else {
    bundler.plugin(minifyify, { map: false });
  }

  return bundle();
});
