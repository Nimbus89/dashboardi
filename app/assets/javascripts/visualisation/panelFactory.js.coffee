class @PanelFactory
  constructor: (gridster, socket, app) ->
    @gridster = gridster
    @socket = socket
    @app = app

  create: (json) =>
    switch json.type
      when "value" then new window.ValuePanel(json, @app, @socket, @gridster)
      when "navbutton" then new window.NavButtonPanel(json, @app, @socket, @gridster)
      when "gaugepanel" then new window.GaugePanel(json, @app, @socket, @gridster)
      when "timeseries" then new window.TimeSeriesPanel(json, @app, @socket, @gridster)
      when "image" then new window.ImagePanel(json, @app, @socket, @gridster)
      else alert("Unknown panel type: " + json.type);