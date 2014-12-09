gulp = require 'gulp'
nodemon = require 'gulp-nodemon'
gutil = require 'gulp-util'



gulp.task 'server', ->
  nodemon
    script: './api/koa.js'
    ignore: ['node_modules', './api/*.js', 'dist']
    nodeArgs: ['--harmony']
    ext: 'coffee jade'
  .on 'start', ['coffee', 'server-coffee']
  .on 'error', ->
    console.log "あれ?"
  .on 'change', ['coffee', 'server-coffee']
  .on 'restart', ->
    console.log "restart server"
    return
