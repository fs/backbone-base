import gulp from 'gulp';
import rename from 'gulp-rename';
import browserify from 'browserify';
import transform from 'vinyl-transform';
import jadeify from 'jadeify';
import babelify from 'babelify';
import watchify from 'watchify';
import notify from 'gulp-notify';
import config from '../config';

const ENTRY_POINT = `./${config.appDir}/scripts/main.js`;

gulp.task('browserify', function() {
  let bundler = browserify({
    cache: {},
    packageCache: {},
    fullPaths: true,
    debug: true,
    extensions: ['.jade', '.js'],
    entries: ENTRY_POINT,
    paths: ['./' + config.appDir]
  })
  .transform(jadeify)
  .transform(babelify.configure({ sourceMapRelative: `./${config.appDir}` }));

  function bundle() {
    let bundleTransform = transform(() => bundler.bundle());

    return gulp.src(ENTRY_POINT)
      .pipe(bundleTransform)
      .on('error', notify.onError())
      .pipe(rename({ basename: 'application' }))
      .pipe(gulp.dest(config.publicDir))
  };

  watchify(bundler).on('update', bundle);

  return bundle();
});
