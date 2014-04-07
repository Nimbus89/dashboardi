class @RadarChartPanel extends @Panel
  constructor: (json, app, socket) ->
    super(json, app, socket, 'PieChartPanel')

    @keys = json.properties.keys

    if !@keys?
      throw "No keys set for Radar Chart Panel."

    @labels = json.properties.labels || []
    @colour = @hexToRgb(json.properties.colour)

    if(@keys.length > @labels.length)
      for i in [@labels.length..@keys.length]
        @labels[i] = @keys[i]

    while(@keys.length < @labels.length)
      @labels.pop()

    @id = @generateUUID()
    @values = {}
    for key in @keys
      @values[key] = 0

    @render()
    for key in @keys
      socket.add_subscription(key, this)

  render: =>
    super
    @chart = new Chart($("#"+@id)[0].getContext("2d")).Radar(@dataHash(), {animation: false})

  update: (key, newValue) =>
    @values[key] = newValue
    @html.remove()
    @render()

  renderHash: =>
    @mergeHashes super(), {id: @id}

  dataHash: =>
    data = []
    for key, i in @keys
      data.push(@values[key])

    {labels: @labels, datasets: [{data: data, fillColor : @colour_rgba(0.5), strokeColor : @colour_rgba(1),  pointColor : @colour_rgba(1)}] }
  hexToRgb: (hex) =>
    #source: http://stackoverflow.com/questions/5623838/rgb-to-hex-and-hex-to-rgb
    result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex)
    if result then {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } else null
  colour_rgba: (alpha) =>
    "rgba(" + @colour.r + "," + @colour.g + "," + @colour.b + "," + alpha + ")"
