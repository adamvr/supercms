# Module dependencies
express = require 'express'
routes = require './routes'
user = require './routes/user'
http = require 'http'
path = require 'path'
mongoose = require 'mongoose'

# App
module.exports = app = express()

# DB Connection
mongoose.connect 'mongodb://localhost/test'
db = app.db = mongoose.connection

db.on 'error', (err) -> console.dir(err)

# Configuration options (general)
app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(path.join __dirname, 'public')

# Configuration options (dev)
app.configure 'development', ->
  app.use express.errorHandler()

# Routes
app.get '/', routes.index
app.get '/users', user.list

# Start it!
app.start = ->
  http.createServer(app).listen app.get('port'), ->
    console.log """
      Express server listening on port #{app.get('port')}
    """

app.start() if require.main is module
