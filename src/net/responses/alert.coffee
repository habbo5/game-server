prepare = (data) ->

  message =
    header: 'alert'
    title: data.title
    message: data.message
    button: data.button || 'OK'
    trigger: data.trigger

  return message

module.exports = prepare
