logger = require '@/utils/logger'
hallway = require '@/core/rooms/hallway'
composer = require '@/net/composer'

handle = (client, data) ->

  room = await hallway.getRoom data.uid

  return client.respond composer.createResponse('alert', {
      title: 'Notice!'
      message: 'The room you requested could not be found, did the owner delete it?'
  }) unless room

  return client.respond composer.createResponse('enter-room', {
    room: room
  })

module.exports = handle
