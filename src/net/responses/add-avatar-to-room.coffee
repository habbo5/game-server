prepare = (data) ->

  message =
    header: 'add_avatar_to_room'
    id: data.uid
    x : data.x
    y: data.y
    r: data.r
    look: "konquer"

  return message

module.exports = prepare
