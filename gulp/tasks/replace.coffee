fs = require('fs')
gulp = require('gulp')
replace = require('gulp-replace-task')
config = require('../config')

gulp.task 'replace', ->
  env = 'development'
  settings = JSON.parse(fs.readFileSync("./#{config.appDir}/config/environments/#{env}.json", 'utf8'))

  gulp.src("./#{config.appDir}/config/config.coffee")
    .pipe(replace(
      patterns: [
        {
          match: 'env'
          replacement: env
        }
        {
          match: 'apiPath'
          replacement: settings.apiPath
        }
        {
          match: 'storageKey'
          replacement: settings.storageKey
        }
        {
          match: 'sessionKey'
          replacement: settings.sessionKey
        }
      ]
    ))
    .pipe(gulp.dest("./#{config.appDir}/scripts"))
