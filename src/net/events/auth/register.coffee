logger = require '@/utils/logger'
shortid = require 'shortid'
validator = require 'validator'
bcrypt = require 'bcrypt'
User = require '@/storage/models/user'
composer = require '@/net/composer'

handle = (client, data) ->
  return if client.habbo || !data.password || !data.username

  userExists = await User.findOne { username: data.username }

  usernameTakenError = composer.createResponse('auth.registration-error', { error: 'Username has already been taken' })
  return client.respond usernameTakenError if userExists

  hash = await bcrypt.hash(data.password, 10)

  user = await User.create {
    uid: shortid.generate()
    username: data.username
    password: hash
  }

  userCreationError = composer.createResponse('auth.registration-error', { error: 'Error during user creation' })
  return client.respond userCreationError unless user

  authenticatedMessage = composer.createResponse('auth.authenticated', { username: user.username })
  return client.respond authenticatedMessage

module.exports = handle
