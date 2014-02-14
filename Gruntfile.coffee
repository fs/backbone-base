module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    appDir: 'app'
    publicDir: 'public'
    productionDir: 'production'
    testDir: 'tests'
    ports:
      livereload: 35729
      connect: 8000
      easymock: 8001

    symlink:
      development:
        files: [
          expand: true
          overwrite: false
          cwd: ''
          src: ['bower_components', 'vendor']
          dest: '<%= publicDir %>'
          filter: 'isDirectory'
        ]

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

    stylus:
      development:
        options:
          linenos: true
          compress: false
          urlfunc: 'embedurl'
          paths: ['bower_components', 'vendor']
        files:
          '<%= publicDir %>/stylesheets/style.css': '<%= appDir %>/stylesheets/application.styl'

    jade:
      html:
        options:
          pretty: true
          client: false
        files: [
          '<%= publicDir %>/index.html': ['<%= appDir %>/index.jade']
        ]
      jst:
        options:
          pretty: false
          client: true
          amd: true
          processName: (filename) ->
            filename.slice(filename.indexOf('templates'), filename.length - 5)
        files: [
          '<%= publicDir %>/scripts/templates.js': ['<%= appDir %>/templates/**/*.jade']
        ]

    clean:
      development: [
        '<%= publicDir %>/**/*'
      ]
      production: [
        '<%= productionDir %>/scripts'
        '<%= productionDir %>/stylesheets'
        '<%= productionDir %>/bower_components'
        '<%= productionDir %>/vendor'
      ]

    requirejs:
      production:
        options:
          name: 'scripts/config'
          preserveLicenseComments: false
          findNestedDependencies: true
          optimize: 'uglify2'
          uglify2:
            output:
              beautify: false
            compress:
              global_defs:
                DEBUG: false
          baseUrl: '<%= productionDir %>'
          mainConfigFile: '<%= productionDir %>/scripts/config.js'
          out: '<%= productionDir %>/application.js'
          # removeCombined: false

    connect:
      options:
        port: '<%= ports.connect %>'
        livereload: '<%= ports.livereload %>'
        hostname: 'localhost'
        middleware: (connect, options) ->
          proxy = require('grunt-connect-proxy/lib/utils').proxyRequest
          pushState = require('grunt-connect-pushstate/lib/utils').pushState
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
        port: '<%= ports.easymock %>'
      ]

    watch:
      options:
        livereload: true
        spawn: false
      files: ['<%= appDir %>/**/*']
      tasks: [
        'templates'
        'stylus:development'
        'coffee:development'
        'coffeelint'
      ]

    easymock:
      api:
        options:
          port: '<%= ports.easymock %>'
          path: 'mocks'

    jsonlint:
      development:
        src: ['mocks/**/*.json']

    mocha:
      options:
        reporter: 'Nyan'
        run: true

    shell:
      bower:
        options:
          stdout: true
        command:
          'bower install'

    concurrent:
        compile: [
          'templates'
          'stylus:development'
          'coffee:development'
          'coffeelint'
        ]

    copy:
      production:
        files: [
          expand: true
          cwd: '<%= publicDir %>'
          src: ['**']
          dest: '<%= productionDir %>'
        ,
          src: '<%= publicDir %>/stylesheets/style.css'
          dest: '<%= productionDir %>/style.css'
        ,
          src: '<%= publicDir %>/bower_components/requirejs/require.js'
          dest: '<%= productionDir %>/require.js'
        ]

    htmlmin:
      production:
        options:
          removeComments: true
          collapseWhitespace: true
        files:
          '<%= productionDir %>/index.html': '<%= publicDir %>/index.html'

    require('load-grunt-tasks')(grunt)

    grunt.registerTask 'templates', [
      'jade:html'
      'jade:jst'
    ]

    grunt.registerTask 'test', '', ->
      grunt.task.run('coffee:tests')
      grunt.config.set('mocha.browser', ['<%= testDir %>/**/*.html'])
      grunt.task.run('mocha')

    grunt.registerTask 'initialize', [
      'clean:development'
      'symlink:development'
<<<<<<< HEAD
      'templates'
      'stylus:development'
      'coffee:development'
      'coffeelint'
      'jsonlint:development'
=======
      'concurrent:compile'
>>>>>>> improve-gruntfile
      'connect:livereload'
      'easymock'
      'configureProxies:server'
    ]

    grunt.registerTask 'production', [
      'copy:production'
      'requirejs:production'
      'htmlmin:production'
      'clean:production'
      # 'clean:public'
      # 'initialize'
      # 'requirejs:public'
    ]

    grunt.registerTask 'default', [
      'shell:bower'
      'initialize'
      'watch'
    ]
