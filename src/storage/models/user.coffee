mongoose = require('mongoose')

Schema = mongoose.Schema

UserSchema = new Schema({

  uid: {
    type: String
    required: "Must have a uid"
    unique: "true"
  }

  username: {
    type: String
    required: "Can't be left open"
    unique: "true"
    match: [/^[a-zA-Z0-9]+$/, "is invalid"]
  }

  password: {
    type: String
    required: "Can't be left open"
  }

  figure: String


})

module.exports = mongoose.model('user', UserSchema)
