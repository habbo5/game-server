logger = require '@/utils/logger'
bcrypt = require 'bcrypt'
user = require '@/storage/models/user'

handle = (client, data) ->
  return if client.habbo || !data.password || !data.username

  user.findOne({ username: data.username })
  .then (user) ->
    return bcrypt.hash(data.password, 10)
  .then (hash) ->
    return bcrypt.compare(data.password, hash)
  .then (res) ->
    if res
      # check if this account is already logged in
      # create habbo and forward client
    else
      # wrong passwords
  .catch (error) ->
    client.emit('test', error)

module.exports = handle
