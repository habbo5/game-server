logger = require '@/utils/logger'

class Habbo

  constructor: () ->
    logger.info 'Habbo is initiating'

  @getInstance: () ->
    @_instance ?= new @()

module.exports = Habbo
