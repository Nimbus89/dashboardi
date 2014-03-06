class @PanelFactory
  constructor: (socket, app) ->
    @socket = socket
    @app = app

  create: (json) =>
    switch json.type
      when "value" then new window.ValuePanel(json, @app, @socket)
      when "navbutton" then new window.NavButtonPanel(json, @app, @socket)
      when "gaugepanel" then new window.GaugePanel(json, @app, @socket)
      when "timeseries" then new window.TimeSeriesPanel(json, @app, @socket)
      when "image" then new window.ImagePanel(json, @app, @socket)
      when "label" then new window.LabelPanel(json, @app, @socket)
      when "pie_chart" then new window.PieChartPanel(json, @app, @socket)
      when "doughnut_chart" then new window.DoughnutChartPanel(json, @app, @socket)
      else alert("Unknown panel type: " + json.type);