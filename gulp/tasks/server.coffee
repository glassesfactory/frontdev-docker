gulp = require 'gulp'
nodemon = require 'gulp-nodemon'


gulp.task 'koa', ->
  nodemon
    script: './api/koa.js'
    nodeArgs: ['--harmony']
  .on 'restart'


gulp.task 'server', ->
  gulp.start 'coffee:watch'
  gulp.start 'server-coffee:watch'
  gulp.start 'koa'
