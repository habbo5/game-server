logger = require '@/utils/logger'
WebSocket = require 'ws'
composer = require '@/net/composer'

class Server

    @getInstance: ->
      @_instance ?= new @()

    init: ->
      @wss = new WebSocket.Server { port: process.env.WS_PORT }

      @wss.on 'connection', (client) =>

        client.on 'close', () ->
          client.roomUser?.leave()
          delete client.habbo
          delete client.roomUser
          client.habbo = null
          client.roomUser = null

        client.on 'message', (data) ->
          try
            data = JSON.parse data
            (require '@/net/events/' + data.header)(client, data)
          catch e
            if e.code and e.code is 'MODULE_NOT_FOUND'
              logger.debug "Received event in incorrect format: #{JSON.stringify data} - Error:  #{e.toString()}"
            else
              logger.error e.toString()
          unless e
            logger.debug "Handled event: #{JSON.stringify data}"

        client.respond = (response) -> try client.send(JSON.stringify response) catch e then logger.error e.toString()

        logger.debug "new client connection handled"

      logger.info "Server is listening on port #{process.env.WS_PORT}"


  module.exports = Server
