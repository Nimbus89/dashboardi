class @GaugePanel extends @Panel
  constructor: (json, app, socket) ->
    super(json, app, socket, 'GaugePanel')
    @gauge = null

    @sizeX = 2
    @sizeY = 2

    @title = json.properties.title || "Title"
    @min = json.properties.min || 0
    @max = json.properties.max || 100

    @id = @generateUUID()

    @render()
    @socket.add_subscription(json.properties.key, this)

  render: =>
    super
    @gauge = new JustGage({id: @id, title: @title, min: @min, max: @max})

  update: (key, newValue) =>
    @gauge.refresh(newValue)

  renderHash: =>
    @mergeHashes super(), {id: @id}