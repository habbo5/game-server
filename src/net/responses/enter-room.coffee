prepare = (data) ->

  message =
    header: 'enter_room'
    owner: data.room.owner_uid
    name : data.room.name
    description: 'description_undefined'
    likes: 0
    hasRights: false
    size: data.room.size
    floorData: data.room.floor_data

  return message

module.exports = prepare
