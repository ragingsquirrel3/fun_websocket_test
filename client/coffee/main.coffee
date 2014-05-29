VENDOR = "vendor"
requirejs.config
  paths:
    'jquery': "#{VENDOR}/jquery.min"
    'underscore': "#{VENDOR}/underscore.min"
    'jade': "#{VENDOR}/jade.min"
    'd3': "#{VENDOR}/d3.min"
    'io': "#{VENDOR}/socket.min"
  shim:
    'jquery': exports: '$'
    'underscore': exports: '_'
    'jade': exports: 'jade'
    'd3': exports: 'd3'

requirejs ['jquery', 'd3', 'underscore', 'io'], ($, d3, _, io) ->
  socket = io.connect 'http://localhost:5000'
  socket.on 'news', (data) ->
    console.log data
    socket.emit 'my other event', { my: 'data' }
