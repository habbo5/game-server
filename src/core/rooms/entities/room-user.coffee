shortid = require "shortid"

class RoomUser

  constructor: (@client, @room) ->
    @uid = shortid.generate()
    @x = 0
    @y = 0
    @targetX = 0
    @targetY = 0
    @r = 0
    @look = 'Konquer'
    @isWalking = false

  wantsToMove: ->
    return @x isnt @targetX or @y isnt @targetY

module.exports = RoomUser
