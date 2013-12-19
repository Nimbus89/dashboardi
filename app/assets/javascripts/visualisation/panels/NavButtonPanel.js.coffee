class @NavButtonPanel extends @Panel
  constructor: (json, app, gridster) ->
    super(json, gridster, app, null, "NavButtonPanel")
    @sizeX = 3
    @sizeY = 2
    @text = json.properties.link_text
    @ref = json.properties.navagate_to

    @render()

  render: =>
    super()
    @html.click(() => 
      @app.changePage(@ref);
    );

  renderHash: =>
    {text: this.text}