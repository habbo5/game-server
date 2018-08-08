prepare = (data) ->

  message =
    header: 'remove_avatar'
    id: data.uid

  return message

module.exports = prepare
