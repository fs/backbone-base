import gulp from 'gulp';
import postcss from 'gulp-postcss';
import config from '../config';
import stylelintConfig from '../../config/stylelint';

import stylelint from 'stylelint';
import postcssReporter from 'postcss-reporter';

gulp.task('stylelint', () => {
  return gulp.src(`${config.appDir}/stylesheets/**/*.css`)
    .pipe(postcss([
      stylelint(stylelintConfig),
      postcssReporter({ clearMessages: true })
    ]));
});
