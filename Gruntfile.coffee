module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    appDir: 'app'
    devDir: 'develop'
    publicDir: 'public'

    #coffeelint
    coffeelint:
      files:
        src: ['<%= appDir %>coffee/**/*']
      options:
        'no_trailing_whitespace':
          'level': 'error'
        'camel_case_classes':
          'level': 'error'
        'newlines_after_classes':
          'level': 'warning'

    #coffee
    coffee:
      options:
        bare: true
      dev:
        files: [
          expand: true
          cwd: "<%= appDir %>/coffee"
          src: ["*.coffee", "**/*.coffee"]
          dest: "<%= devDir %>/js"
          ext: ".js"
        ]

    #compass
    compass:
      dev:
        options:
          sassDir: '<%= appDir %>/sass'
          cssDir: '<%= devDir %>/css'
          imagesDir: '<%= devDir %>/images'

    #underscore templates to jst converter
    jst:
      dev:
        files:
          "<%= devDir %>/js/templates.js": ["<%= appDir %>/templates/**/*.html"]

    #сopy
    copy:
      dev: 
        expand: true
        cwd: '<%= appDir %>/templates'
        src: '**/*'
        dest: '<%= devDir %>/templates'

    #clean
    clean:
      dev: [
        '<%= devDir %>/**/*'
        '<%= devDir %>/js/**/*'
        '!<%= devDir %>/js'
        '!<%= devDir %>/js/libs'
        '!<%= devDir %>/js/libs/**/*'
      ]
      pub: ['<%= pubDir %>']

    #requirejs(concat + uglify)
    requirejs:
      pub:
        options:
          name: "app"
          preserveLicenseComments: false
          findNestedDependencies: true
          optimize: "uglify2"
          uglify2:
            output:
              beautify: false
            compress:
              global_defs:
                DEBUG: false
          baseUrl: "<%= devDir %>/js"
          out: "<%= devDir %>/js/app.min.js"
          mainConfigFile: "<%= devDir %>/js/app.js"
          removeCombined: false

    #removing console.log
    removelogging:
      src: "<%= devDir %>/js/**/*.js"

    #The following *-min tasks pubuce minified files in the dist folder
    imagemin:
      files: [
        expand: true,
        cwd: '<%= devDir %>/images'
        src: '**/*.gif,jpeg,jpg,png'
        dest: '<%= pubDir %>/images'
      ]

    #web-server
    connect:
      options:
        port: 8000
        livereload: 35729
        hostname: 'localhost'
      livereload:
        options:
          #open: true
          base: '.'

    #watch
    watch:
      options:
        livereload: true
        spawn: false
      dev:
        files: [
          '<%= appDir %>/coffee/**/*' 
          '<%= appDir %>/scss/**/*'
          '<%= appDir %>/sass/**/*' 
          '<%= appDir %>/templates/**/*'
        ]
        tasks: [
          'compass:dev'
          'coffee:dev'
          'jst:dev'
          'coffeelint'
        ]

    #install npm packages
    require("load-grunt-tasks")(grunt)

    #global tasks
    grunt.registerTask 'initialize', [
      'clean:dev'
      'compass:dev'
      'jst:dev'
      'coffee:dev'
      'coffeelint'
      'connect:livereload'
    ]

    grunt.registerTask 'public', [
      'clean:pub'
      'initialize'
      'removelogging'
      'imagemin'
      'require:pub'
    ]

    grunt.registerTask 'default', [
      'initialize'
      'watch:dev'
    ]
