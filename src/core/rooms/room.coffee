logger = require '@/utils/logger'

class Room

  entities: []

  constructor: (@uid, @name, @owner_uid, @floor_data, @size, @spawn_x, @spawn_y, @spawn_direction, @public) ->

    @interval = setInterval(@cycle, 500)

    logger.debug "Room loaded [#{@uid}] [#{@name}]"


  cycle: ->


module.exports = Room
