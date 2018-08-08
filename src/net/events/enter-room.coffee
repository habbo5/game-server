logger = require '@/utils/logger'
hallway = require '@/core/rooms/hallway'
composer = require '@/net/composer'
RoomUser = require '@/core/rooms/entities/room-user'

handle = (client, data) ->

  return unless client.habbo

  room = await hallway.getRoom data.uid

  return client.respond composer.createResponse('alert', {
      title: 'Notice!'
      message: 'The room you requested could not be found, did the owner delete it?'
  }) unless room

  client.roomUser?.room?.removeUser client.roomUser

  roomUser = new RoomUser(client, room)

  client.roomUser = roomUser

  client.respond composer.createResponse('enter-room', {
    room: room
  })

  room.addUser roomUser

module.exports = handle
