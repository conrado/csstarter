# Load all required libraries.
gulp     = require 'gulp'
gutil    = require 'gulp-util'
coffee   = require 'gulp-coffee'
istanbul = require 'gulp-istanbul'
mocha    = require 'gulp-mocha'
plumber  = require 'gulp-plumber'
docco    = require 'gulp-docco'

gulp.on 'err', (e) ->
  gutil.beep()
  gutil.log e.err.stack

gulp.task 'coffee', ->
  gulp.src './src/**/*.coffee'
    # Prevent pipe breaking on gulp plugins errors
    .pipe plumber()
    .pipe coffee({bare: true})
    .pipe gulp.dest './lib/'

gulp.task 'test', ['coffee'], ->
  gulp.src ['lib/**/*.js']
     # Covering files
    .pipe(istanbul())
    # Overwrite require to return covered files
    .pipe(istanbul.hookRequire())
    .on 'finish', ->
      gulp.src(['test/**/*.spec.coffee'])
        .pipe mocha reporter: 'spec', compilers: 'coffee:coffee-script'
         # Creating the reports after test run
        .pipe istanbul.writeReports()

gulp.task 'docs', ->
  gulp.src(['./src/**.coffee', './scr/**.litcoffee'])
    .pipe(docco())
    .pipe(gulp.dest('./docs'))

gulp.task 'watch', ->
  gulp.watch './src/**/*.coffee', ['coffee']

gulp.task 'default', ['coffee']
