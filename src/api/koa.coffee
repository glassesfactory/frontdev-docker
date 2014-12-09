fs = require
path    = require 'path'

koa = require 'koa'
logger = require 'koa-logger'
route = require 'koa-route'
serve = require 'koa-static'
parse = require 'co-body'
views = require 'co-views'

render = views path.resolve(__dirname, '../') + '/jade', {map:{html:'jade'}}

app = koa()
port = process.env.PORT || 3000
# port = 3000

app.use logger()

list = ->
  this.body = yield render 'index.jade'
  return

show = (id)->
  this.body = yield render 'show.jade', {id: id}
  return


app.use route.get('/', list)
app.use route.get('/:id', show)
app.use serve path.resolve(__dirname, '../../') + '/dist'

app.listen port
