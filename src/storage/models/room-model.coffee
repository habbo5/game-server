mongoose = require('mongoose')

Schema = mongoose.Schema

RoomModelSchema = new Schema({

  model_name: {
    type: String
    required: "Can't be left open"
    unique: "true"
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


})

module.exports = mongoose.model('room-model', RoomModelSchema)
