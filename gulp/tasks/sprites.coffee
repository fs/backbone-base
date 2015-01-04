gulp = require('gulp')
gulpif = require('gulp-if')
plumber = require('gulp-plumber')
spritesmith = require('gulp.spritesmith')
config = require('../config')

gulp.task 'sprites', ->
  gulp.src("#{config.appDir}/images/sprites/**/*.png")
    .pipe(plumber())
    .pipe(spritesmith(
      imgName: 'sprite.png'
      imgPath: 'images/'
      cssName: 'sprite.styl'
      cssFormat: 'stylus'
      algorithm: 'binary-tree'
    ))
    .pipe(gulpif('*.styl', gulp.dest("#{config.appDir}/stylesheets/core/")))
    .pipe(gulpif('*.png', gulp.dest("#{config.publicDir}/images/")))
