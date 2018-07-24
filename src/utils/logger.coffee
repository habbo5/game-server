winston = require 'winston'

logger = winston.createLogger({
  level: process.env.LOG_LEVEL.toLowerCase() || 'info',
  transports: [
    new winston.transports.Console()
  ]
})

module.exports = logger;
