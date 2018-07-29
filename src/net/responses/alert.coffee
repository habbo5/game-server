prepare = (data) ->

  message =
    header: 'alert'
    title: data.title
    message: data.message
    button: data.button || 'OK'

  return message

module.exports = prepare
