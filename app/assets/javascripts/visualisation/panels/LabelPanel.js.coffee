class @LabelPanel extends @Panel
  constructor: (json, app, socket) ->
    super(json, app, socket, 'LabelPanel')
    @text = json.properties.default_text 
    @render()
    
    if (json.properties.key?.length)
      @socket.add_subscription(json.properties.key, this)
    

  update: (key, newValue) =>
    @text = newValue
  renderHash: =>
    @mergeHashes super(), {text:this.text}