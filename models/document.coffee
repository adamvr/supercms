# Module deps
app = require '../app'
mongoose = app.mongoose;

Document = module.exports.Document =
  mongoose.model 'Document', mongoose.Schema
    title: String
    text: String
    type: { type: String, default: 'markdown' }
    createdAt: { type: Date, default: Date.now }
