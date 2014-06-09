module.exports = (grunt) ->
	grunt.loadNpmTasks "grunt-karma"
	grunt.loadNpmTasks "grunt-contrib-coffee"
	grunt.loadNpmTasks "grunt-contrib-clean"
	grunt.loadNpmTasks "grunt-contrib-jade"
	grunt.loadNpmTasks "grunt-contrib-less"
	grunt.loadNpmTasks "grunt-contrib-concat"
	grunt.loadNpmTasks "grunt-ngmin"
	grunt.loadNpmTasks "grunt-contrib-uglify"

	grunt.initConfig
		pkg: grunt.file.readJSON('package.json'),
		coffee:
			dev: 
				options:
					join: false
					sourceMap: true
				files:
					'./public/app.js': ['assets/coffee/*.coffee']
			prod: 
				files:
					'./public/app.js': ['assets/coffee/*.coffee']
			dist: 
				files:
					'./dist/angular-img-onload.js': ['assets/coffee/*.coffee']
		ngmin:
			dist:
				src: ["./dist/angular-img-onload.js"]
				dest: "./dist/angular-img-onload.min.js"
			prod:
				src: ["./public/app.js"]
				dest: "./public/app.min.js"
		uglify:
			banner: "/* ©Laurent Margirier */"
			prod:
				files: [{
					dest: "./public/app.min.js"
					src: ["./public/app.min.js"]
				}]
			dist:
				files: [{
					dest: "./dist/angular-img-onload.min.js"
					src: ["./dist/angular-img-onload.min.js"]
				}]
					
		jade: 
			dev: 
				options: 
					pretty: true
				files: [{
					expand: true,
					cwd: 'assets/jade/'
					src: ['*.jade']
					dest: 'public/'
					ext: '.html'
				}]
			prod: 
				files: [{
					expand: true,
					cwd: 'assets/jade/'
					src: ['*.jade']
					dest: 'public/'
					ext: '.html'
				}]

		less:
			dev:
				options:
					sourceMap: true
				files:
					'./public/app.css': ['assets/less/*.less']
			prod:
				files:
					'./public/app.css': ['assets/less/*.less']
		clean: ['public']

		concat:
			dev:
				options:
					separator: ";"

				dest: "public/deps.js"
				src: [
					"bower_components/angular/angular.js"
					"bower_components/angular-animate/angular-animate.min.js"
					"bower_components/angular-ui-router/release/angular-ui-router.min.js"
					"bower_components/lodash/dist/lodash.min.js"
				]
			prod:
				options:
					separator: ";"

				dest: "public/deps.js"
				src: [
					"bower_components/angular/angular.min.js"
					"bower_components/angular-animate/angular-animate.min.js"
					"bower_components/angular-ui-router/release/angular-ui-router.min.js"
					"bower_components/lodash/dist/lodash.min.js"
				]

		watch: 
			assets:
				files: ['assets/**/*']
				tasks: ['default']

		karma:
			unit:
				configFile: "./test/karma-unit.conf.js"
				autoWatch: false
				singleRun: true

	grunt.registerTask 'build', ['coffee:dist','ngmin','uglify:dist']
	grunt.registerTask 'default', ['clean','concat:dev','coffee:dev','jade:dev','less:dev']
	grunt.registerTask 'prod', ['clean','concat:prod','coffee:prod','jade:prod','less:prod']
	grunt.registerTask 'watch', ['clean','coffee:dev','jade:dev','less:dev','watch:assets']
	grunt.registerTask 'w', ['watch']
	grunt.registerTask "test:unit", [
		"karma:unit"
	]
