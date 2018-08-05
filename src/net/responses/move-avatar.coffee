prepare = (data) ->

  message =
    header: 'move_avatar'
    id: data.uid
    x: data.x
    y: data.y

  return message

module.exports = prepare
