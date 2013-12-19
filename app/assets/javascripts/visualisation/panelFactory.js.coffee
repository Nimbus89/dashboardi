class @PanelFactory
  constructor: (gridster, socket, app) ->
    @gridster = gridster
    @socket = socket
    @app = app

  create: (json) =>
    switch json.type
      when "value" then new window.ValuePanel(json, this.socket, this.gridster)
      when "navbutton" then new window.NavButtonPanel(json, this.app, this.gridster)
      when "gaugepanel" then new window.GaugePanel(json, this.socket, this.gridster)
      when "timeseries" then new window.TimeSeriesPanel(json, this.socket, this.gridster)
      else alert("Unknown panel type: " + json.type);