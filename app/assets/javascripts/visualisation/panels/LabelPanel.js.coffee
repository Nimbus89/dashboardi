class @LabelPanel extends @Panel
  constructor: (json, app, socket) ->
    super(json, app, socket, 'LabelPanel')

    @key = json.properties.key

    @text = json.properties.default_text 
    @render()
    
    if (json.properties.key?.length)
      @socket.add_subscription(@key, this)
    

  update: (key, newValue) =>
    @text = newValue
    @render()
  renderHash: =>
    @mergeHashes super(), {text:this.text}