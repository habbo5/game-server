prepare = (data) ->

  message =
    header: 'add_avatar_to_room'
    id: data.uid
    x : data.x
    y: data.y
    r: data.r
    look: data.figure || "1"

  return message

module.exports = prepare
