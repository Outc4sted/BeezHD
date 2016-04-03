task 'server', 'Start development server on localhost:9001', ->
    startServer()

startServer = () ->
    supervisor = require 'supervisor'
    supervisor.run ['-q', 'server.coffee']
    console.log 'Development server running on localhost:1337'
