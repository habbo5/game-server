logger = require '@/utils/logger'
WebSocket = require 'ws'

class Server

    init: ->
      @wss = new WebSocket.Server({
          port: process.env.WS_PORT
      })

      @wss.on 'connection', (ws) ->
        logger.debug "a new ws connection was handled!"

      logger.info "Server is listening on port #{process.env.WS_PORT}"

    @getInstance: ->
      @_instance ?= new @()

  module.exports = Server
