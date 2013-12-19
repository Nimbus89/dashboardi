class @GaugePanel extends @Panel
  constructor: (json, socket, gridster) ->
    super(json, gridster, null, socket, 'GaugePanel')
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

  update: (newValue) =>
    @gauge.refresh(newValue)

  renderHash: =>
    {id: this.id}

  generateUUID: =>
    d = new Date().getTime()
    'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) ->
        r = (d + Math.random()*16)%16 | 0
        d = Math.floor(d/16)
        (c=='x' ? r : (r&0x7|0x8)).toString(16)
    )