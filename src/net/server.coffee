logger = require '@/utils/logger'
io = require 'socket.io'
eventRegistry = require '@/net/event-registry'

class Server

    @getInstance: ->
      @_instance ?= new @()

    init: ->
      @wss = io.listen(process.env.WS_PORT)

      @wss.on 'connection', (client) =>
        @registerClientEvent(client, event) for event in eventRegistry

        logger.info "new client connection handled"

      logger.info "Server is listening on port #{process.env.WS_PORT}"


    registerClientEvent: (client, event) ->
      return unless event.enabled

      parts = event.uid.split('.')

      uid = parts[parts.length - 1]
      namespace = ''
      if parts.length > 1
        parts.splice parts.length - 1, 1
        namespace = parts.join('/') + '/'

      client.on uid, (data) -> (require '@/net/events/' + namespace + uid)(client, data)

  module.exports = Server
