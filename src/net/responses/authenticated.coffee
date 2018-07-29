prepare = (data) ->

  message =
    header: 'authenticated'
    username: data.username

  return message

module.exports = prepare
