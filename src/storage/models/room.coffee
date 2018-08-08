mongoose = require('mongoose')

Schema = mongoose.Schema

RoomSchema = new Schema({

  uid: {
    type: String
    required: "Must have a uid"
    unique: "true"
  }

  name: String,

  owner_uid: {
    type: String
    required: "Must have an owner"
  }

  floor_data: {
    type: String
    required: "Can't be left open"
  }

  size: {
    type: Number
    required: "Can't be left open"
  }

  spawn_x: {
    type: Number
    required: "Can't be left open"
  }

  spawn_y: {
    type: Number
    required: "Can't be left open"
  }

  spawn_direction: {
    type: Number
    required: "Can't be left open"
  }

  public: Boolean

})

module.exports = mongoose.model('room', RoomSchema)
