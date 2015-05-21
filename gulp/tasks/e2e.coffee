gulp = require('gulp')
config = require('../config')
shell = require('gulp-shell')
runSequence = require('run-sequence')

casperCommand = "mocha-casperjs \
  --chai-path=node_modules/chai \
  --casper-chai-path=node_modules/casper-chai \
  --viewport-width=1280 \
  --viewport-height=800 \
  <%= file.path %>
"

gulp.task 'e2e', ->
  gulp.src("#{config.testDir}/features/**/*_feature.coffee", read: false)
      .pipe(shell(casperCommand))
