logger = require '@/utils/logger'
RoomSchema = require '@/storage/models/room'
Room = require '@/core/rooms/room'
composer = require '@/net/composer'
shortid = require 'shortid'

rooms = {}

exports.getRoom = (uid) ->

  return rooms[uid] if rooms[uid]

  roomData = await RoomSchema.findOne({ uid: uid })

  return unless roomData

  rooms[uid] = new Room(roomData.uid, roomData.name, roomData.owner_uid, roomData.floor_data, roomData.size, roomData.spawn_x, roomData.spawn_y, roomData.spawn_direction, roomData.public)

  return rooms[uid]

exports.closeRoom = (uid) ->
  if rooms[uid]
    rooms[uid].dispose()
    delete rooms[uid]

exports.createRoom = (roomData) ->
  room = await RoomSchema.create {
    uid: shortid.generate()
    name: roomData.name
    owner_uid: roomData.owner_uid
    floor_data: roomData.floor_data
    size: roomData.size
    spawn_x: roomData.spawn_x
    spawn_y: roomData.spawn_y
    spawn_direction: roomData.spawn_direction
    public: roomData.public
  }

  return @getRoom room.uid

exports.getRooms = () ->
  return rooms

  return room
