prepare = (data) ->

  message =
    header: 'room_list'
    rooms: data.rooms
    listName: data.listName

  return message

module.exports = prepare
