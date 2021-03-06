logger = require '@/utils/logger'
db = require '@/storage/db'
server = require '@/net/server'

class Habbo

  @init: ->
    logger.info "Habbo is initiating"

    await db.getInstance().init()
    await server.getInstance().init()

    logger.info "The deathstar is fully armed and operational"


  @getInstance: ->
    @_instance ?= new @()

  @quitGracefully: ->
    logger.info "Blowing up the deathstar"
    process.exit()

module.exports = Habbo
