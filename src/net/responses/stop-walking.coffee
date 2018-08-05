prepare = (data) ->

  message =
    header: 'stop_walking'
    id: data.uid

  return message

module.exports = prepare
