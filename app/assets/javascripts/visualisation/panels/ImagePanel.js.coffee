class @ImagePanel extends @Panel
  constructor: (json, app, socket) ->
    super(json, app, socket, 'ImagePanel')

    @key = json.properties.key

    @index = 0
    @srcs = json.properties.images

    if !@srcs?
      throw "No images set for image panel."
      
    @render()
    if @key?
      @socket.add_subscription(@key, this)

  render: =>
    super
    @gauge = new JustGage({id: @id, title: @title, min: @min, max: @max})

  update: (key, newValue) =>
    if @srcs[((Number) newValue)]?
      @index = (Number) newValue
    else
      @index = 0

    @html.html(@template(@renderHash()))
    newHtml = $(@template(@renderHash()))
    @html.replaceWith(newHtml)
    @html = newHtml
  renderHash: =>
    @mergeHashes super(), {src: @srcs[@index]}