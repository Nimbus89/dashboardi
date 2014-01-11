class @NavButtonPanel extends @Panel
  constructor: (json, app, socket) ->
    super(json, app, socket, "NavButtonPanel")
    @text = json.properties.link_text
    @ref = json.properties.navagate_to

    @render()

  render: =>
    super()
    @html.click(() => 
      @app.changePage(@ref);
    );

  renderHash: =>
    @mergeHashes super(), {text: this.text}