class @GaugePanel extends @Panel
  constructor: (json, app, socket, gridster) ->
    super(json, gridster, app, socket, 'ImagePanel')
    @key = 0
    render()
    @socket.add_subscription(json.properties.key, this)

  render: =>
    super
    @gauge = new JustGage({id: @id, title: @title, min: @min, max: @max})

  update: (newValue) =>
    if @srcs[newValue]?
      @key = newValue
    else
      @key = 0

    @html.html(@template(@renderHash()))

  renderHash: =>
    {src: @srcs[@key]}