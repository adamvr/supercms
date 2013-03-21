require('net').createServer(function(socket) {
  require('repl').start('repl> ', socket);
}).listen(5001, 'localhost');
require('coffee-script');
require('./app').start();
