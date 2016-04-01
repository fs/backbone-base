import gulp from 'gulp';
import plumber from 'gulp-plumber';
import postcss from 'gulp-postcss';
import notify from 'gulp-notify';
import sourcemaps from 'gulp-sourcemaps';
import config from '../config';

import postcssSortingConfig from '../../config/postcss_sorting';
import postcssGlobalVariables from '../../config/postcss_variables';

import postcssSorting from 'postcss-sorting';
import postcssInlineComment from 'postcss-inline-comment';
import postcssImport from 'postcss-import';
import postcssMixins from 'postcss-mixins';
import postcssNested from 'postcss-nested';
import postcssSimpleVars from 'postcss-simple-vars';
import postcssColorFunction from 'postcss-color-function';
import postcssPxtorem from 'postcss-pxtorem';
import autoprefixer from 'autoprefixer';

gulp.task('stylesheets', () => {
  const processors = [
    postcssInlineComment,
    postcssImport,
    postcssMixins,
    postcssNested,
    postcssSimpleVars({
      variables: postcssGlobalVariables
    }),
    postcssColorFunction,
    postcssPxtorem({
      root_value: 13,
      replace: false
    }),
    autoprefixer({ browsers: ['last 2 versions'] })
  ];

  if (config.development) {
    return gulp.src(`${config.appDir}/stylesheets/application.css`)
      .pipe(plumber())
      .pipe(sourcemaps.init())
      .pipe(postcss(processors))
      .on('error', notify.onError())
      .pipe(sourcemaps.write('.'))
      .pipe(gulp.dest(config.distDir));
  }
  else {
    return gulp.src(`${config.appDir}/stylesheets/application.css`)
      .pipe(plumber())
      .pipe(postcss(processors))
      .on('error', notify.onError())
      .pipe(gulp.dest(config.distDir));
  }
});

gulp.task('stylesheets-sort', () => {
  return gulp.src(`${config.appDir}/stylesheets/**/*.css`)
    .pipe(plumber())
    .pipe(postcss([postcssSorting(postcssSortingConfig)]))
    .on('error', notify.onError())
    .pipe(gulp.dest(`${config.appDir}/stylesheets`));
});
