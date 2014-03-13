class @GaugePanel extends @Panel
  constructor: (json, app, socket) ->
    super(json, app, socket, 'GaugePanel')

    @key = json.properties.key

    if !@key?
      throw "No key set for gauge panel."

    @gauge = null

    @title = json.properties.title || "Title"
    @min = json.properties.min || 0
    @max = json.properties.max || 100

    @id = @generateUUID()

    @color = $(".panel").css("color")

    @render()
    @socket.add_subscription(@key, this)

  render: =>
    super
    @gauge = new JustGage({id: @id, title: @title, min: @min, max: @max, valueFontColor:@color, titleFontColor:@color, labelFontColor:@color})

  update: (key, newValue) =>
    @gauge.refresh(newValue)

  renderHash: =>
    @mergeHashes super(), {id: @id}