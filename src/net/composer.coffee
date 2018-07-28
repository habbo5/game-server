pathResolver = require '@/utils/path-resolver'

class Composer

  @createResponse: (uid, data) ->
    path = pathResolver uid
    response = (require '@/net/responses/' + path.namespace + path.uid)(data)
    return response

module.exports = Composer
