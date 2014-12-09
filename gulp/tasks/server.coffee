gulp = require 'gulp'
nodemon = require 'gulp-nodemon'
gutil = require 'gulp-util'
watch = require 'gulp-watch'
plumber = require 'gulp-plumber'
coffee = require 'gulp-coffee'

genNodeMan = ->
  nodemon
    script: './src/api/koa.js'
    # env: PORT:3000
    ignore: ['node_modules', './src/api/*.js', 'dist']
    nodeArgs: ['--harmony']
    ext: 'coffee jade'
  .on 'error', ->
    console.log "あれ?"
  .on 'restart', ->
    console.log "restart server"
    return
  return nodemon


#クライアント用(ウォッチする)
gulp.task 'coffee:watch', ->
  nodemon = genNodeMan()
  gulp.src './src/coffee/*.coffee'
  .pipe watch './src/coffee/*.coffee', ->
    console.log "change main"
    nodemon?.emit? 'change'
  .pipe plumber gutil.log
  .pipe coffee
    bare:true
    harmony: true
  .pipe gulp.dest './dist/assets/javascripts/'

  gulp.src './src/api/*.coffee'
  .pipe watch './src/api/*.coffee', ->
    console.log "change server"
    nodemon?.emit? 'change'
  .pipe coffee
    bare: true
    harmony: true
  .pipe gulp.dest './src/api/'
