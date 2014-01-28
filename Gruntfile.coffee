pushState = require('grunt-connect-pushstate/lib/utils').pushState

module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    appDir: 'app'
    devDir: 'develop'
    publicDir: 'public'

    #coffeelint
    coffeelint:
      files:
        src: ['<%= appDir %>/coffee/**/*.coffee']
      options:
        'no_trailing_whitespace':
          level: 'warn'
        'camel_case_classes':
          level: 'warn'
        'newlines_after_classes':
          level: 'warn'
        'arrow_spacing':
          level: 'warn'
        'max_line_length':
          level: 'ignore'

    #coffee
    coffee:
      options:
        bare: true
      dev:
        files: [
          expand: true
          cwd: '<%= appDir %>/coffee'
          src: ['*.coffee', '**/*.coffee']
          dest: '<%= devDir %>/js'
          ext: '.js'
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
          '<%= devDir %>/js/templates.js': ['<%= appDir %>/templates/**/*.html']

    #сopy
    copy:
      dev: 
        expand: true
        cwd: '<%= appDir %>/index.html'
        src: '.'
        dest: '<%= devDir %>/index.html'

    #clean
    clean:
      dev: [
        '<%= devDir %>/index.html'
        '<%= devDir %>/**/*'
        '!<%= devDir %>/js'
        '!<%= devDir %>/js/libs'
        '!<%= devDir %>/js/libs/**/*'
      ]
      pub: ['<%= pubDir %>']

    #requirejs(concat + uglify)
    requirejs:
      pub:
        options:
          name: 'app'
          preserveLicenseComments: false
          findNestedDependencies: true
          optimize: 'uglify2'
          uglify2:
            output:
              beautify: false
            compress:
              global_defs:
                DEBUG: false
          baseUrl: '<%= devDir %>/js'
          out: '<%= devDir %>/js/app.min.js'
          mainConfigFile: '<%= devDir %>/js/app.js'
          removeCombined: false
          
    #web-server
    connect:
      options:
        port: 8000
        livereload: 35729
        hostname: 'localhost'
        middleware: (connect, options) ->
          proxy = require('grunt-connect-proxy/lib/utils').proxyRequest
          [
            proxy
            pushState()
            connect.static(options.base)
            connect.directory(options.base)
          ]
      livereload:
        options:
          #open: true
          base: '<%= devDir %>'
      proxies: [
        context: '/api'
        host: 'localhost'
        port: 8080
      ]

    #mocks
    easymock:
      api:
        options:
          port: 8080
          path: 'mocks'

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

    #shell scripts
    shell:
      bowerInstall:
        options:
          stdout: true
        command: 
          '[ "$(ls <%= devDir %>/js/libs)" ] && echo "<%= devDir%>/js/libs is not Empty. Libraries are already installed" || bower install'

    #loading grunt tasks
    require('load-grunt-tasks')(grunt)

    #global tasks
    grunt.registerTask 'initialize', [
      'clean:dev'
      'copy:dev'
      'compass:dev'
      'jst:dev'
      'coffee:dev'
      'coffeelint'
      'connect:livereload'
      'easymock'
      'configureProxies:server'
    ]

    grunt.registerTask 'public', [
      'clean:pub'
      'initialize'
      'require:pub'
    ]

    grunt.registerTask 'default', [
      'shell:bowerInstall'
      'initialize'
      'watch:dev'
    ]
