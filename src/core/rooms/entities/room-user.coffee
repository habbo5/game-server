shortid = require "shortid"

class RoomUser

  constructor: (@client, @room) ->
    @uid = shortid.generate()
    @x = @room.spawn_x
    @y = @room.spawn_y
    @targetX = @room.spawn_x
    @targetY = @room.spawn_y
    @r = @room.spawn_direction
    @figure = @client.habbo.figure
    @isWalking = false

  wantsToMove: ->
    return @x isnt @targetX or @y isnt @targetY

  leave: ->
    @room.removeUser @

module.exports = RoomUser
