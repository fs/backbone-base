through = require('through2')
path = require('path')

module.exports.jst = ->
  transform = (file, enc, callback) ->
    unless file.isBuffer()
      @push(file)
      callback()

    fileName = file.path.slice(file.path.indexOf('templates'), file.path.length - 3)
    from = "function template(locals) {"
    to = "this[\"JST\"][\"#{fileName}\"] = function template(locals) {"
    contents = file.contents.toString().replace(from, to)

    file.contents = new Buffer(contents)
    @push(file)
    callback()

  through.obj transform

module.exports.amd = ->
  transform = (file, enc, callback) ->
    unless file.isBuffer()
      @push(file)
      callback()

    contents = """
      define(['jade'], function(jade) { if(jade && jade['runtime'] !== undefined) { jade = jade.runtime; }
      this["JST"] = this["JST"] || {};

      #{file.contents.toString()}

      return this["JST"];
      });
    """

    file.contents = new Buffer(contents)
    @push(file)
    callback()

  through.obj transform
