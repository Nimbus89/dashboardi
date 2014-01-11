class @ValuePanel extends @Panel
  constructor: (json, app, socket) ->
    super(json, app, socket, 'ValuePanel')

    @title = json.properties.title
    @unit = json.properties.unit
    @currentValue = json.properties.default || 0
    
    @render()
    @socket.add_subscription(json.properties.key, this)
  update: (key, newValue) =>
    @currentValue = newValue
    newHtml = $(@template(@renderHash()))
    @html.replaceWith(newHtml)
    @html = newHtml
  renderHash: =>
    @mergeHashes super(), {value:this.currentValue, title:this.title, unit:this.unit}