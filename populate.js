require('coffee-script');
var Document = require('./models/document').Document;

/*
for (var i = 0; i < 30; i += 1) {
  var d = new Document({title: 'Document #' + i, text: '# Asdf'});
  d.save();
}
*/

Document.find(console.log);
