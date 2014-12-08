# coffee = require 'gulp-coffee'
watch = require 'gulp-watch'
gulp = require 'gulp'
gutil = require 'gulp-util'
plumber = require 'gulp-plumber'
through = require 'through2'
exec = require('child_process').exec

#うーん
coffee = (opt) ->
  return through.obj (file, enc, cb) ->
    console.log file.path
    cmd  = 'coffee ' + opt + ' --print ' + file.path
    exec cmd, (err, stdout, stderr) ->
      if stderr
        console.log 'stderr', stderr
        cb new gutil.PluginError 'compile-coffee',
          message: stderr
          filename: file.path
      else
        file.path     = gutil.replaceExtension file.path, '.js'
        file.contents = new Buffer stdout
        cb null, file


#クライアント用
gulp.task 'coffee', ->
  gulp.src './src/coffee/*.coffee'
  .pipe plumber gutil.log
  .pipe coffee '--compile --bare --nodejs --harmony'
  .pipe gulp.dest './dist/assets/javascripts/'

#クライアント用(ウォッチする)
gulp.task 'coffee:watch', ->
  console.log "ここですかもしや"
  gulp.src './src/coffee/*.coffee'
  .pipe watch './src/coffee/*.coffee'
  .pipe plumber gutil.log
  .pipe coffee '--compile --bare --nodejs --harmony'
  .pipe gulp.dest './dist/assets/javascripts/'

#サーバー用
gulp.task 'server-coffee:watch', ->
  console.log "ここですかもしや?"
  gulp.src './api/*.coffee'
  .pipe watch './api/*.coffee'
  .pipe plumber gutil.log
  .pipe coffee '--compile --bare --nodejs --harmony'
  .pipe gulp.dest './api/'

# うぉっちしない
gulp.task 'server-coffee', ->
  gulp.src './api/*.coffee'
  .pipe plumber gutil.log
  .pipe coffee '--compile --bare --nodejs --harmony'
  .pipe gulp.dest './api/'
