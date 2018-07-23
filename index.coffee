# Allows us to require absolute paths using @
require('module-alias/register')

# Allows us to use local environment variables
require('dotenv').config()

Habbo = require '@/habbo'

Habbo.init()
