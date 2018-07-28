logger = require '@/utils/logger'
WebSocket = require 'ws'
eventRegistry = require '@/net/event-registry'
pathResolver = require '@/utils/path-resolver'
composer = require '@/net/composer'

class Server

    @getInstance: ->
      @_instance ?= new @()

    init: ->
      @wss = new WebSocket.Server { port: process.env.WS_PORT }

      @wss.on 'connection', (client) =>
        @registerClientEvent(client, event) for event in eventRegistry

        client.respond = (response) -> client.send(JSON.stringify response)

        logger.info "new client connection handled"

      logger.info "Server is listening on port #{process.env.WS_PORT}"


    registerClientEvent: (client, event) ->
      return unless event.enabled

      path = pathResolver event.uid

      client.on path.uid, (data) -> (require '@/net/events/' + path.namespace + path.uid)(client, data)


  module.exports = Server
