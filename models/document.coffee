# Module deps
app = require '../app'
mongoose = app.mongoose

docSchema = mongoose.Schema
  title: String
  text: String
  type: { type: String, default: 'markdown' }
  createdAt: { type: Date, default: Date.now }

docSchema.methods.toHtml = () ->
  switch @type
    when 'markdown'
      require('node-markdown').Markdown(@text)

Document = module.exports.Document =
  mongoose.model 'Document', docSchema
