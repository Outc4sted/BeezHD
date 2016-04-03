express = require "express"
stylus  = require "stylus"
http    = require "http"

app = express()

app.use require("connect-assets")(paths: ["views", "style", "js"])
app.use "/public", express.static(__dirname + "/public")

app.set "view engine", "jade"
app.use stylus.middleware({
    warn:     true
    compress: true
    src:      "#{__dirname}/style"
    dest:     "#{__dirname}/public"
})

app.get "*", (req,res) ->
    res.render "layout"

app.use (err, req, res, next) ->
  console.error err.stack
  res.send 500, 'Something broke'

server = http.createServer app
server.listen 1337
