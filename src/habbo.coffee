class Habbo

  constructor: () ->
    console.log "Habbo is initiating"

  @getInstance: () ->
    @_instance ?= new @()

module.exports = Habbo
