resolve = (uid) ->
  parts = uid.split('.')

  path =
    uid: parts[parts.length - 1]
    namespace: ''

  if parts.length > 1
    parts.splice parts.length - 1, 1
    path.namespace = parts.join('/') + '/'

  return path

module.exports = resolve
