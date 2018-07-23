logger = require '@/utils/logger'
mongoose = require 'mongoose';

class DB

    init: ->
      mongoose.Promise = global.Promise
      mongoose.connect(process.env.MONGO_DB_URI, { useNewUrlParser: true })
      .then ->
        logger.info "DB Connected"
      .catch (err) ->
        logger.error "Error connecting to DB: #{err}"
        require('@/habbo').quitGracefully()

    @getInstance: ->
      @_instance ?= new @()

  module.exports = DB
