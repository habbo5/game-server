prepare = (data) ->

  message =
    header: 'login-error'
    payload:
      error: data.error

  return message

module.exports = prepare
