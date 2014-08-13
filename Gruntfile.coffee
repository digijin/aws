module.exports = (grunt) ->

	require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

	grunt.initConfig {

	}

	grunt.registerTask 'test', ->
		console.log "testing"

	grunt.registerTask 'default', ['test']
