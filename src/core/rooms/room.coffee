SquareMap = require '@/core/rooms/tiles/squaremap'
composer = require '@/net/composer'
logger = require '@/utils/logger'
pathfinder = require '@/core/pathfinding/pathfinder'

class Room

  constructor: (@uid, @name, @owner_uid, @floor_data, @size, @spawn_x, @spawn_y, @spawn_direction, @public) ->

    @roomUsers = []

    @squaremap = new SquareMap(@floor_data, @size)

    @interval = setInterval(@cycle.bind(@), 500)

    logger.debug "Room loaded [#{@uid}] [#{@name}]"


  addUser: (user) ->
    @roomUsers.push user

    toAllRoomUsers = composer.createResponse('add-avatar-to-room', user)

    for roomUser in @roomUsers
      roomUser.client.respond toAllRoomUsers

      user.client.respond composer.createResponse('add-avatar-to-room', roomUser) unless roomUser is user

  removeUser: (user) ->
    @roomUsers = @roomUsers.filter (roomUser) -> roomUser.client isnt user.client

    userRemovedMessage = composer.createResponse('remove-avatar-from-room', user)

    roomUser.client.respond userRemovedMessage for roomUser in @roomUsers when roomUser isnt user


  cycle: ->

    usersToBroadcast = []
    usersFinishedWalking = []

    for user in @roomUsers

      unless user.wantsToMove()
        usersFinishedWalking.push user if user.isWalking
        user.isWalking = false
        continue

      newPos = pathfinder.getClosestSquare(@squaremap, user.x, user.y, user.targetX, user.targetY)

      if newPos.x is user.x and newPos.y is user.y
        usersFinishedWalking.push user if user.isWalking and user not in usersFinishedWalking
        continue

      user.isWalking = true

      user.r = pathfinder.getRotation(user.x, user.y, newPos.x, newPos.y)

      user.x = newPos.x
      user.y = newPos.y

      usersToBroadcast.push user if user not in usersToBroadcast

    @broadcastSnapshot(usersToBroadcast, usersFinishedWalking)


  broadcastSnapshot: (usersToBroadcast, usersFinishedWalking) ->
    for roomUser in @roomUsers
      roomUser.client.respond composer.createResponse('move-avatar', movedUser) for movedUser in usersToBroadcast
      roomUser.client.respond composer.createResponse('stop-walking', idleUser) for idleUser in usersFinishedWalking


  dispose: ->
    clearInterval @interval




module.exports = Room
