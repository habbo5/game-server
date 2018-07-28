prepare = (data) ->

  message =
    header: 'authenticated'
    payload:
      username: data.username

  return message

module.exports = prepare
