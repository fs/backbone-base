import gulp from 'gulp';
import plumber from 'gulp-plumber';
import postcss from 'gulp-postcss';
import notify from 'gulp-notify';
import config from '../config';

import postcssImport from 'postcss-import';
import postcssMixins from 'postcss-mixins';
import postcssNested from 'postcss-nested';
import postcssSimpleVars from 'postcss-simple-vars';
import postcssColorFunction from 'postcss-color-function';
import postcssPxtorem from 'postcss-pxtorem';
import autoprefixer from 'autoprefixer-core';

gulp.task('stylesheets', () => {
  const processors = [
    postcssImport,
    postcssMixins,
    postcssNested,
    postcssSimpleVars,
    postcssColorFunction,
    postcssPxtorem({
      root_value: 13,
      replace: false
    }),
    autoprefixer({ browsers: ['last 2 versions'] })
  ];

  return gulp.src(`${config.appDir}/stylesheets/application.css`)
    .pipe(plumber())
    .pipe(postcss(processors))
    .on('error', notify.onError())
    .pipe(gulp.dest(config.publicDir));
});
