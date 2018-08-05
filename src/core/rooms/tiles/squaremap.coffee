Square = require '@/core/rooms/tiles/square'
SquareState = require '@/core/rooms/tiles/squarestate'

class SquareMap

  squares: []

  constructor: (@floorData, size) ->
    @size = { x: size, y: @floorData.length / size }
    @squares = @generate2dArray()

  generate2dArray: ->
    array2d = []
    for i in [0...@size.x] by 1
      array2d[i] = []
      for j in [0...@size.y] by 1
        array2d[i].push new Square @valueFromFloorData(i, j)
    return array2d


  valueFromFloorData: (x, y) ->
    index = @size.x * y
    return @floorData.substring(index + x, 1)

  getSquare: (x, y) ->
    return @squares[y][x]

  validTile: (x, y) ->
    try
      return @squares[y][x].state is SquareState.OPEN
    catch
      return false



module.exports = SquareMap
