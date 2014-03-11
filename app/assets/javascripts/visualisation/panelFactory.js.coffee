class @PanelFactory
  constructor: (socket, app, eh) ->
    @socket = socket
    @app = app
    @eHandler = eh

  create: (json) =>
    try
      switch json.type
        when "value" then new window.ValuePanel(json, @app, @socket)
        when "navbutton" then new window.NavButtonPanel(json, @app, @socket)
        when "gaugepanel" then new window.GaugePanel(json, @app, @socket)
        when "timeseries" then new window.TimeSeriesPanel(json, @app, @socket)
        when "image" then new window.ImagePanel(json, @app, @socket)
        when "label" then new window.LabelPanel(json, @app, @socket)
        when "pie_chart" then new window.PieChartPanel(json, @app, @socket)
        when "doughnut_chart" then new window.DoughnutChartPanel(json, @app, @socket)
        when "radar_chart" then new window.RadarChartPanel(json, @app, @socket)
        when "polar_chart" then new window.PolarChartPanel(json, @app, @socket)
        when "bar_chart" then new window.BarChartPanel(json, @app, @socket)
        else alert("Unknown panel type: " + json.type);
    catch err 
      @eHandler.handle(err)
      