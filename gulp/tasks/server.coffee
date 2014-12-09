gulp = require 'gulp'
nodemon = require 'gulp-nodemon'
gutil = require 'gulp-util'


gulp.task 'koa', ->
  nodemon
    script: './api/koa.js'
    nodeArgs: ['--harmony']
    debug: true
    delay: 10
  # .on 'start', ['coffee:watch', 'server-coffee:watch']
  .on 'error', ->
    console.log "あれ?"
  # .on 'change', ['coffee:watch', 'server-coffee:watch']
  .on 'restart', ->
    console.log "restart server"
    return


gulp.task 'server', ->
  gulp.start 'coffee:watch'
  gulp.start 'server-coffee:watch'
  gulp.start 'koa'
