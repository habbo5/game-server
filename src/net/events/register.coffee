logger = require '@/utils/logger'
shortid = require 'shortid'
validator = require 'validator'
bcrypt = require 'bcrypt'
User = require '@/storage/models/user'
composer = require '@/net/composer'

handle = (client, data) ->
  return if client.habbo || !data.password || !data.username

  userExists = await User.findOne { username: { $regex : new RegExp(data.username, "i") } }

  client.respond composer.createResponse('alert', {
      title: 'Notice!'
      message: 'Username has already been taken.'
  }) if userExists

  hash = await bcrypt.hash(data.password, 10)

  user = await User.create {
    uid: shortid.generate()
    username: data.username
    password: hash
  }

  client.respond composer.createResponse('alert', {
      title: 'Notice!'
      message: 'Error during user creation. Please try again later.'
  }) unless user

  authenticatedMessage = composer.createResponse('authenticated', { username: user.username })
  return client.respond authenticatedMessage

module.exports = handle
