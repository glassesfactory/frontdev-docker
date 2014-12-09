# coffee = require 'gulp-coffee'
watch = require 'gulp-watch'
gulp = require 'gulp'
gutil = require 'gulp-util'
plumber = require 'gulp-plumber'
through = require 'through2'
coffee = require 'gulp-coffee'


#クライアント用
gulp.task 'coffee', ->
  gulp.src './src/coffee/*.coffee'
  .pipe plumber gutil.log
  .pipe coffee
    bare:true
    harmony: true
  .pipe gulp.dest './dist/assets/javascripts/'

# #クライアント用(ウォッチする)
# gulp.task 'coffee:watch', ->
#   gulp.src './src/coffee/*.coffee'
#   .pipe watch './src/coffee/*.coffee'
#   .pipe plumber gutil.log
#   .pipe coffee
#     bare:true
#     harmony: true
#   .pipe gulp.dest './dist/assets/javascripts/'

#サーバー用
gulp.task 'server-coffee:watch', ->
  gulp.src './src/api/*.coffee'
  .pipe watch './src/api/*.coffee'
  .pipe coffee
    bare: true
    harmony: true
  .pipe gulp.dest './src/api/'

# うぉっちしない
gulp.task 'server-coffee', ->
  gulp.src './src/api/*.coffee'
  .pipe plumber gutil.log
  .pipe coffee
    bare: true
    harmony: true
  .pipe gulp.dest './src/api/'
