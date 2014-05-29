ASSET_BUILD_PATH = 'server/client_build/development'
PORT = process.env.PORT ? 5000

# setup app and socket io
app = require('express')()
server = require('http').createServer(app)
io = require('socket.io').listen(server)

app.configure ->

  # serve static assets
  app.use('/', require('express').static("#{__dirname}/#{ASSET_BUILD_PATH}"))

io.on 'connection', (socket) ->
  socket.emit 'news', { hello: 'world' }
  socket.on 'other event', (data) -> console.log data

server.listen PORT
