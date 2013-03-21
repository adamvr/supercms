# App
app = require '../app'

# Models
{Document} = require '../models/document'

module.exports.index = (req, res, next) ->
  Document.find (err, docs) ->
    next(err) if err
    res.render 'documents/index', title: 'Documents', docs: docs

module.exports.show = (req, res, next) ->
  Document.findById req.params.document, (err, doc) ->
    next(err) if err
    res.render 'documents/show', title: doc.title, doc: doc.toHTML()
