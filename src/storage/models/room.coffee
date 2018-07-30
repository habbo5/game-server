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
    unique: "true"
  }

  model_name: {
    type: String
    required: "Can't be left open"
    unique: "true"
  }

})

module.exports = mongoose.model('room-model', RoomSchema)
