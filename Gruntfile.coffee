module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    easymock:
      api:
        options:
          port: 8001
          path: "mocks"

  grunt.loadNpmTasks "grunt-easymock"
  grunt.registerTask "mocks", ["easymock"]
