pushState = require('grunt-connect-pushstate/lib/utils').pushState

module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    appDir: 'app'
    publicDir: 'public'
    testDir: 'tests'

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
          "<%= publicDir %>/stylesheets/style.css": "<%= appDir %>/stylesheets/application.styl"

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
      ]

    requirejs:
      public:
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
          baseUrl: '<%= publicDir %>'
          mainConfigFile: '<%= publicDir %>/scripts/config.js'
          out: '<%= publicDir %>/scripts/app.min.js'
          removeCombined: false

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
          port: 8080
          path: 'mocks'

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
      'symlink:development'
      'templates'
      'stylus:development'
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
    ]

    grunt.registerTask 'default', [
      'shell:bower'
      'initialize'
      'watch'
    ]
