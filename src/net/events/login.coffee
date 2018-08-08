logger = require '@/utils/logger'
bcrypt = require 'bcrypt'
User = require '@/storage/models/user'
composer = require '@/net/composer'

handle = (client, data) ->
  return if client.habbo || !data.password || !data.username

  genericLoginError = composer.createResponse('alert', {
    title: 'Notice!'
    message: 'Username and password does not match.'
    trigger: 'login.retry'
  })

  user = await User.findOne({ username: { $regex : new RegExp(data.username, "i") } })

  return client.respond genericLoginError unless user

  correctPw = await bcrypt.compare(data.password, user.password)

  return client.respond genericLoginError unless correctPw

  client.habbo =
    username: user.username
    figure: user.figure

  authenticatedMessage = composer.createResponse('authenticated', { username: user.username })
  return client.respond authenticatedMessage

module.exports = handle
