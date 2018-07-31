logger = require '@/utils/logger'
Room = require '@/storage/models/room'
composer = require '@/net/composer'

handle = (client, data) ->
  return unless client.habbo or data.list_name

  rooms = []

  switch data.list_name
    when 'public'
      rooms = await Room.find({ public: true }, '-_id uid name')

  client.respond(composer.createResponse('room-list', { rooms: rooms, listName: 'public' }))



module.exports = handle
