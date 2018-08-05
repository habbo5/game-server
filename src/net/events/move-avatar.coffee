logger = require '@/utils/logger'
composer = require '@/net/composer'

handle = (client, data) ->

  return unless client.habbo or client.roomUser or data.x or data.y or client.roomUser.room.squaremap.validTile(x, y)

  client.roomUser.targetX = data.x
  client.roomUser.targetY = data.y

module.exports = handle
