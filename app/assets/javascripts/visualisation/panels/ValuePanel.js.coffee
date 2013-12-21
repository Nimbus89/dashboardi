class @ValuePanel extends @Panel
  constructor: (json, app, socket, gridster) ->
    super(json, gridster, app, socket, 'ValuePanel')
    @sizeX = 3
    @sizeY = 2

    @title = json.properties.title
    @unit = json.properties.unit
    @currentValue = json.properties.default || 0
    
    @render()
    @socket.add_subscription(json.properties.key, this)
  update: (newValue) =>
    @currentValue = newValue
    @html.html(@template(@renderHash()))
  renderHash: =>
    {value:this.currentValue, title:this.title, unit:this.unit}