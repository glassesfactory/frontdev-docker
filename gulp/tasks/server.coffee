gulp = require 'gulp'
nodemon = require 'gulp-nodemon'
gutil = require 'gulp-util'
child_process = require 'child_process'
app = require('../../src/api/koa')

gulp.task 'koa', ->
  child = child_process.execFile '/usr/local/bin/node/bin/node', ['--harmony', './src/api/koa.js'], (err, stdout, stderr)->
    if not err
      console.log 'stdout:', stdout
      console.log 'stderr:', stderr
    else
      console.log err
      console.log err.code
      console.log err.signal
    return
  child.stderr.on 'data', (data)->
    console.log data, "pya-"
    return
  child.stdout.on 'data', (data)->
    console.log data, "うよー"
    return


gulp.task 'server', ->
  nodemon
    script: './src/api/koa.js'
    # env: PORT:3000
    ignore: ['node_modules', './src/api/*.js', 'dist']
    nodeArgs: ['--harmony']
    ext: 'coffee jade'
  .on 'start', ['koa']
  .on 'error', ->
    console.log "あれ?"
  .on 'change', ['koa']
  .on 'restart', ->
    console.log "restart server"
    return
