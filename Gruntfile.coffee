module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    appDir: 'app'
    devDir: 'develop'
    publicDir: 'public'

    #coffeelin
    coffeelint:
      pub:
        files:
          src: ['<%= appDir %>coffee/**/*.coffee', '!<%= devDir %>/libs/**/*.coffee']

    #coffee
    coffee:
      options:
        bare: true
      dev:
        files: [
          expand: true
          cwd: "<%= appDir %>/coffee/"
          src: ["**/*.coffee"]
          dest: "<%= devDir %>/js/"
          ext: ".js"
        ]

    #compass
    compass:
      dev:
        options:
          sassDir: '<%= appDir %>/sass'
          cssDir: '<%= devDir %>/css'
          imagesDir: '<%= devDir %>/images'

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

    #clean
    clean:
      pub: ['<%= devDir %>']

    #removing console.log
    removelogging:
      pub:
        src: "<%= devDir %>/js/**/*.js"

    #The following *-min tasks pubuce minified files in the dist folder
    imagemin:
      pub:
        files: [
          expand: true,
          cwd: '<%= devDir %>/images'
          src: '**/*.gif,jpeg,jpg,png'
          dest: '<%= devDir %>/images'
        ]

    #web-server
    connect:
      options:
        port: 8000
        livereload: 35729
        hostname: 'localhost'
      livereload:
        options:
          open: true
          base: '.'

    #watch
    watch:
      options:
        livereload: true
        spawn: false
      dev:
        files: [
          '<%= appDir %>/coffee/**/*.coffee' 
          '<%= appDir %>/scss/**/*.scss'
          '<%= appDir %>/sass/**/*.sass' 
        ]
        tasks: [
          'compass:dev'
          'coffee:dev'
        ]

    #install npm packages
    require("load-grunt-tasks")(grunt)

    #global tasks
    grunt.registerTask 'initialize', [
      'compass:dev'
      'coffee:dev'
      'coffeelint:pub'
      'connect:livereload'
    ]

    grunt.registerTask 'public', [
      'clean:pub'
      'initialize'
      'removelogging:pub'
      'imagemin:pub'
      'coffeelint:pub'
      'require:pub'
    ]

    grunt.registerTask 'default', [
      'initialize'
      'watch:dev'
    ]
