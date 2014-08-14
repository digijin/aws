module.exports = (grunt) ->

  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.initConfig {
    watch:
      src:
        files: ['**/*.*']
        tasks: ['run']
    coffeelint:
      app: ['Gruntfile.coffee','index.coffee']
    execute:
      app:
        src:['index.js']
    coffee:
      app:
        src:['index.coffee']
        dest: 'index.js'
  }

  grunt.registerTask 'test', ->
    console.log "testing"

  grunt.registerTask 'run', ['coffeelint', 'test', 'coffee', 'execute']
  grunt.registerTask 'default', ['run', 'watch']
