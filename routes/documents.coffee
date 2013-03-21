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
    res.render 'documents/show', title: doc.title, doc: doc

module.exports.edit = (req, res, next) ->
  Document.findById req.params.document, (err, doc) ->
    next(err) if err
    res.render 'documents/edit', title: doc.title, doc: doc

module.exports.update = (req, res, next) ->
  Document.findById req.body.id, (err, doc) ->
    next(err) if err
    doc.title = req.body.title
    doc.text = req.body.text
    doc.save (err) ->
      if err
        next(err)
      else
        res.redirect "/documents/#{doc.id}"

module.exports.new = (req, res, next) ->
  res.render 'documents/new', title: 'New Document'

module.exports.create = (req, res, next) ->
  doc = new Document(req.body)
  doc.save (err) ->
    next(err) if err
    res.redirect "/documents/#{doc.id}"
