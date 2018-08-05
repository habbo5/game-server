squarestate = require '@/core/rooms/tiles/squarestate'

class Tile

  constructor: (value) ->
    @state = if value is "0" then squarestate.EMPTY else squarestate.OPEN

module.exports = Tile
