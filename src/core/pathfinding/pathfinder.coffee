Location = require '@/core/pathfinding/location'

exports.getClosestSquare = (squaremap, fromX, fromY, toX, toY) ->

  locations = []
  closest = new Location(fromX, fromY, @getDistance(fromX, fromY, toX, toY))

  locations[0] = new Location(fromX - 1, fromY - 1, @getDistance(fromX - 1, fromY - 1, toX, toY));
  locations[1] = new Location(fromX - 1, fromY + 1, @getDistance(fromX - 1, fromY + 1, toX, toY));
  locations[2] = new Location(fromX + 1, fromY + 1, @getDistance(fromX + 1, fromY + 1, toX, toY));
  locations[3] = new Location(fromX + 1, fromY - 1, @getDistance(fromX + 1, fromY - 1, toX, toY));
  locations[4] = new Location(fromX, fromY - 1, @getDistance(fromX, fromY - 1, toX, toY));
  locations[5] = new Location(fromX - 1, fromY, @getDistance(fromX - 1, fromY, toX, toY));
  locations[6] = new Location(fromX, fromY + 1, @getDistance(fromX, fromY + 1, toX, toY));
  locations[7] = new Location(fromX + 1, fromY, @getDistance(fromX + 1, fromY, toX, toY));

  for location in locations
    closest = location if squaremap.validTile(location.x, location.y) and location.distance < closest.distance

  return closest


exports.getDistance = (fromX, fromY, toX, toY) ->
  return Math.sqrt(Math.pow(fromX - toX, 2) + Math.pow(fromY - toY, 2))


exports.getRotation = (fromX, fromY, toX, toY) ->
  dX = fromX - toX
  dY = fromY - toY

  return 4 * Math.atan2(dY, dX) / Math.PI + 2
