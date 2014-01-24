class @ImagePanel extends @Panel
  constructor: (json, app, socket) ->
    super(json, app, socket, 'ImagePanel')
    @key = 0
    @srcs = json.properties.images
    @render()
    @socket.add_subscription(json.properties.key, this)

  render: =>
    super
    @gauge = new JustGage({id: @id, title: @title, min: @min, max: @max})

  update: (key, newValue) =>
    if @srcs[newValue]?
      @key = newValue
    else
      @key = 0

    @html.html(@template(@renderHash()))
    newHtml = $(@template(@renderHash()))
    @html.replaceWith(newHtml)
    @html = newHtml
  renderHash: =>
    @mergeHashes super(), {src: @srcs[@key]}