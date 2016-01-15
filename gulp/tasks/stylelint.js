import gulp from 'gulp';
import postcss from 'gulp-postcss';
import config from '../config';

import stylelint from 'stylelint';
import postcssReporter from 'postcss-reporter';

gulp.task('stylelint', () => {
  return gulp.src(`${config.appDir}/stylesheets/**/*.css`)
    .pipe(postcss([
      stylelint({ configFile: `${config.configDir}/stylelint.js` }),
      postcssReporter({ clearMessages: true })
    ]))
});
