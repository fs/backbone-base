gulp = require('gulp')
install = require('gulp-install')

gulp.task 'install', ->
  gulp.src(['./bower.json'])
    .pipe(install())
