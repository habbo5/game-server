logger = require '@/utils/logger'
bcrypt = require 'bcrypt'
User = require '@/storage/models/user'
composer = require '@/net/composer'

handle = (client, data) ->
  return if client.habbo || !data.password || !data.username

  genericLoginError = composer.createResponse('alert', {
    title: 'Notice!'
    message: 'Username and password does not match.'
  })

  user = await User.findOne({ username: data.username })

  return client.respond genericLoginError unless user

  correctPw = await bcrypt.compare(data.password, user.password)

  return client.respond genericLoginError unless correctPw

  authenticatedMessage = composer.createResponse('auth.authenticated', { username: user.username })
  return client.respond authenticatedMessage

module.exports = handle
