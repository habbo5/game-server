winston = require 'winston'

logger = winston.createLogger({
  transports: [
    new winston.transports.Console()
  ]
})

module.exports = logger;
