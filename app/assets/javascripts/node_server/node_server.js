#!/usr/bin/env node
var WebSocketServer = require('websocket').server;
var http = require('http');

var server = http.createServer(function(request, response) {
    console.log((new Date()) + ' Received request for ' + request.url);
    response.writeHead(404);    
    response.end();
});
server.listen(8000, function() {
    console.log((new Date()) + ' Server is listening on port 8000');
});

wsServer = new WebSocketServer({
    httpServer: server,
    autoAcceptConnections: false
});

function originIsAllowed(origin) {
  return true;
}

wsServer.on('request', function(request) {
    if (!originIsAllowed(request.origin)) {
      request.reject();
      console.log((new Date()) + ' Connection from origin ' + request.origin + ' rejected.');
      return;
    }
    var connection = request.accept('visu-protocol', request.origin);
    console.log("New Connection Accepted");
    var looper = setInterval(function(){
      var number = Math.round(Math.random() * 0xFFFFFF);
      var message = JSON.stringify({ key: "key1", val: number});
      connection.sendUTF(message);
      console.log("Message Sent: " + message);
      
    }, 1000);

    connection.on('close', function(reasonCode, description) {
      clearInterval(looper);
    });
});