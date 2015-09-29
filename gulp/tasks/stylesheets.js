import gulp from 'gulp';
import plumber from 'gulp-plumber';
import postcss from 'gulp-postcss';
import notify from 'gulp-notify';
import config from '../config';

import autoprefixer from 'autoprefixer-core';
import pxtorem from 'postcss-pxtorem';

gulp.task('stylesheets', () => {
  const processors = [
    require('postcss-import'),
    require('postcss-mixins'),
    require('postcss-nested'),
    require('postcss-simple-vars'),
    require('postcss-color-function'),
    autoprefixer({ browsers: ['last 2 versions'] }),
    pxtorem({
      root_value: 13,
      replace: false
    })
  ];

  gulp.src(`${config.appDir}/stylesheets/application.css`)
    .pipe(plumber())
    .pipe(postcss(processors))
    .on('error', notify.onError())
    .pipe(gulp.dest(config.publicDir));
});
