pushState = require('grunt-connect-pushstate/lib/utils').pushState

module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    appDir: 'app'
    publicDir: 'public'
    testDir: 'tests'

    copy:
      main:
        expand: true
        src: 'vendor/**/*'
        dest: '<%= publicDir %>/vendor'

    coffeelint:
      files:
        src: ['<%= appDir %>/scripts/**/*.coffee']
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

    coffee:
      options:
        bare: true
      development:
        files: [
          expand: true
          cwd: '<%= appDir %>/scripts'
          src: ['*.coffee', '**/*.coffee']
          dest: '<%= publicDir %>/scripts'
          ext: '.js'
        ]
      tests:
        files: [
          expand: true
          cwd: '<%= testDir %>/coffee'
          src: ['*.coffee', '**/*.coffee']
          dest: '<%= testDir %>/scripts'
          ext: '.js'
        ]

    compass:
      development:
        options:
          sassDir: '<%= appDir %>/stylesheets'
          cssDir: '<%= publicDir %>/stylesheets'
          imagesDir: '<%= publicDir %>/images'

    jade:
      index:
        options:
          pretty: true
          client: false
        files: [
          "<%= publicDir %>/index.html": ["<%= appDir %>/index.jade"]
        ]
      development:
        options:
          pretty: false
          client: true
          amd: true
          processName: (filename) ->
            filename.slice(filename.indexOf("templates"), filename.length - 5)
        files: [
          "<%= publicDir %>/scripts/templates.js": ["<%= appDir %>/templates/**/*.jade"]
        ]

    clean:
      development: [
        '<%= publicDir %>/**/*'
        '!<%= publicDir %>/bower_components'
        '!<%= publicDir %>/bower_components/**/*'
        '!<%= publicDir %>/vendor'
        '!<%= publicDir %>/vendor/**/*'
      ]

    # requirejs:
    #   public:
    #     options:
    #       name: 'js/config'
    #       preserveLicenseComments: false
    #       findNestedDependencies: true
    #       optimize: 'uglify2'
    #       uglify2:
    #         output:
    #           beautify: false
    #         compress:
    #           global_defs:
    #             DEBUG: false
    #       baseUrl: '<%= publicDir %>'
    #       mainConfigFile: '<%= publicDir %>/scripts/config.js'
    #       out: '<%= publicDir %>/scripts/app.min.js'
    #       removeCombined: false

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
          base: '<%= publicDir %>'
      proxies: [
        context: '/api'
        host: 'localhost'
        port: 8080
      ]

    easymock:
      api:
        options:
          port: 8080
          path: 'mocks'

    mocha:
      options:
        reporter: 'Nyan'
        run: true

    watch:
      options:
        livereload: true
        spawn: false
      files: ['<%= appDir %>/**/*']
      tasks: [
        'templates'
        'compass:development'
        'coffee:development'
        'coffeelint'
      ]

    shell:
      bower:
        options:
          stdout: true
        command:
          'bower install'

    require('load-grunt-tasks')(grunt)

    grunt.registerTask 'templates', [
      'jade:index'
      'jade:development'
    ]

    grunt.registerTask 'test', '', ->
      grunt.task.run('coffee:tests')
      grunt.config.set('mocha.browser', ['<%= testDir %>/**/*.html'])
      grunt.task.run('mocha')

    grunt.registerTask 'initialize', [
      'clean:development'
      'copy:main'
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
      # 'shell:bower'
      'initialize'
      'watch'
    ]
