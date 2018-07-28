prepare = (data) ->

  message =
    header: 'registration-error'
    payload:
      error: data.error

  return message

module.exports = prepare
