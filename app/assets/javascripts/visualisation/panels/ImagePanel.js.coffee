class @ImagePanel extends @Panel
  constructor: (json, app, socket) ->
    super(json, app, socket, 'ImagePanel')
    @sizeX = 2
    @sizeY = 2
    @key = 0
    @srcs = json.properties.srcs
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

  renderHash: =>
    {src: @srcs[@key]}