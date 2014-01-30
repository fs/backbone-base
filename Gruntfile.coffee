pushState = require('grunt-connect-pushstate/lib/utils').pushState

module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    appDir: 'app'
    developmentDir: 'develop'
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
      development:
        files: [
          expand: true
          cwd: '<%= appDir %>/coffee'
          src: ['*.coffee', '**/*.coffee']
          dest: '<%= developmentDir %>/js'
          ext: '.js'
        ]

    #compass
    compass:
      development:
        options:
          sassDir: '<%= appDir %>/sass'
          cssDir: '<%= developmentDir %>/css'
          imagesDir: '<%= developmentDir %>/images'

    #jade tamplates to html converter
    jade:
      options:
        client: false
        pretty: true
      development:
        files: [
          expand: true
          cwd: '<%= appDir %>'
          src: '**/*.jade'
          dest: '<%= developmentDir %>',
          ext: '.html'
        ]

    #underscore templates to jst converter
    jst:
      options:
        processName: (filename) ->
          filename.slice(filename.indexOf("templates"), filename.length - 5)
      development:
        files:
          '<%= developmentDir %>/js/templates.js': ['<%= developmentDir %>/templates/**/*.html']

    #сopy
    copy:
      publicCopyStyles: 
        expand: true
        src: '.'
        cwd: '<%= developmentDir %>/css/style.css'
        dest: '<%= publicDir %>/css/style.css'
      publicCopyIndex:
        expand: true
        src: '.'
        cwd: '<%= developmentDir %>/index.html'
        dest: '<%= publicDir %>/index.html'

    #clean
    clean:
      development: [
        '<%= developmentDir %>/**/*'
        '!<%= developmentDir %>/bower_components'
        '!<%= developmentDir %>/bower_components/**/*'
        '!<%= developmentDir %>/vendor'
        '!<%= developmentDir %>/vendor/**/*'
      ]
      public: ['<%= publicDir %>']

    #requirejs(concat + uglify)
    requirejs:
      public:
        options:
          name: 'js/config'
          preserveLicenseComments: false
          findNestedDependencies: true
          optimize: 'uglify2'
          uglify2:
            output:
              beautify: false
            compress:
              global_defs:
                DEBUG: false
          baseUrl: '<%= developmentDir %>'
          mainConfigFile: '<%= developmentDir %>/js/config.js'
          out: '<%= publicDir %>/js/app.min.js'
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
          base: '<%= developmentDir %>'
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
      files: [
        '<%= appDir %>/templates/**/*'
        '<%= appDir %>/scss/**/*'
        '<%= appDir %>/sass/**/*' 
        '<%= appDir %>/coffee/**/*' 
        '<%= appDir %>/*'
      ]
      tasks: [
        'templates'
        'compass:development'
        'coffee:development'
        'coffeelint'
      ]

    #shell scripts
    shell:
      bowerInstall:
        options:
          stdout: true
        command: 
          '[ "$(ls <%= developmentDir %>/bower_components)" ] 
            && echo "<%= developmentDir%>/bower_components is not Empty. 
            Libraries are already installed" || bower install'

    #loading grunt tasks
    require('load-grunt-tasks')(grunt)

    #templates compiler
    grunt.registerTask 'templates', [
      'jade:development'
      'jst:development'
    ]

    #global tasks
    grunt.registerTask 'initialize', [
      'clean:development'
      'templates'
      'compass:development'
      'coffee:development'
      'coffeelint'
      'connect:livereload'
      'easymock'
      'configureProxies:server'
    ]

    grunt.registerTask 'public', [
      'clean:public'
      'initialize'
      'requirejs:public'
      'copy:publicCopyStyles'
    ]

    grunt.registerTask 'default', [
      'shell:bowerInstall'
      'initialize'
      'watch'
    ]
