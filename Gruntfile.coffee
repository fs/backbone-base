module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    buildDir: 'public'
    appDir: 'app/assets'

    #coffeelint
    coffeelint:
      prod:
        files:
          src: ['<%= appDir %>/**/*.coffee', '!<%= srcDir %>/libs/**/*.coffee']

    #coffee
    coffee:
      options:
        bare: true
      dev:
        files: [
          expand: true
          cwd: "<%= appDir %>/coffee"
          src: ["**/*.coffee", "!libs/**/*.coffee"]
          dest: "<%= buildDir %>/js"
          ext: ".js"
        ]

    #compass
    compass:
      dev:
        options:
          sassDir: '<%= appDir %>/sass'
          cssDir: '<%= buildDir %>/css'

    #slim
    slim:
      dev:
        files:
          '<%= buildDir %>/index.html': '<%= appDir %>/index.slim'

    #requirejs(concat + uglify)
    requirejs:
      prod:
        options:
          name: "application"
          preserveLicenseComments: false
          findNestedDependencies: true
          optimize: "uglify2"
          uglify2:
            output:
              beautify: false
            compress:
              global_defs:
                DEBUG: false
          baseUrl: "<%= buildDir %>/js"
          out: "<%= buildDir %>/js/application.min.js"
          mainConfigFile: "<%= buildDir %>/js/application.js"
          removeCombined: false

    #clean
    clean:
      prod: ['<%= buildDir %>']

    #web-server
    connect:
      test:
        options:
          port: 8000
          base: "."

    #watch
    watch:
      options:
        livereload: true
      dev:
        files: ['<%= buildDir %>']
        tasks: [
          'slim:dev'
          'compass:dev'
          'coffee:dev'
        ]

    #install npm packages
    require('matchdep').forEach () -> 
      grunt.loadNpmTasks

    #tasks 
    grunt.registerTask 'development', [
      'slim:dev'
      'compass:dev'
      'coffee:dev'
    ]

    grunt.registerTask 'build', [
      'clean:prod'
      'development'
      'coffeelint:prod'
      'require:prod'
    ]

    grunt.registerTask 'default', [
      'watch'
    ]
