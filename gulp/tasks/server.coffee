gulp = require 'gulp'
nodemon = require 'gulp-nodemon'
gutil = require 'gulp-util'


gulp.task 'koa', ->
  nodemon
    script: './api/koa.js'
    nodeArgs: ['--harmony']
  .on 'error', gutil.log
  .on 'restart', ->
    console.log "restart server"
    return


gulp.task 'server', ->
  gulp.start 'coffee:watch'
  gulp.start 'server-coffee:watch'
  gulp.start 'koa'
