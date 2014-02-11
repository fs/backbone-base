Marionette.Renderer.render = (template, data) ->
  return unless template
  throw new Error("Template #{template} not found!") unless JST[template]
  return JST[template](data)
