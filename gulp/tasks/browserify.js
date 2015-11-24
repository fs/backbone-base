import gulp from 'gulp';
import rename from 'gulp-rename';
import browserify from 'browserify';
import source from 'vinyl-source-stream';
import jadeify from 'jadeify';
import babelify from 'babelify';
import watchify from 'watchify';
import notify from 'gulp-notify';
import config from '../config';

const entryPoint = `./${config.appDir}/scripts/main.js`;

gulp.task('browserify', () => {
  let bundler = browserify({
    cache: {},
    packageCache: {},
    fullPaths: true,
    debug: config.isDevelopment,
    extensions: ['.jade', '.js'],
    entries: entryPoint,
    paths: [`./${config.appDir}`]
  })
  .transform(jadeify)
  .transform(babelify.configure({
    stage: 1,
    sourceMapRelative: `./${config.appDir}`
  }));

  let bundle = () => {
    let bundleStream = bundler.bundle();

    return bundleStream
      .on('error', notify.onError())
      .pipe(source(entryPoint))
      .pipe(rename('application.js'))
      .pipe(gulp.dest(config.publicDir));
  };

  if (config.isDevelopment) {
    watchify(bundler).on('update', bundle);
  }

  return bundle();
});
