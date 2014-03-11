class @PieChartPanel extends @Panel
  constructor: (json, app, socket) ->
    super(json, app, socket, 'PieChartPanel')

    @keys = json.properties.keys

    if !@keys?
      throw "No keys set for Pie Chart Panel."


    @colours = json.properties.colours || []
    @id = @generateUUID()
    @values = {}
    for key in @keys
      @values[key] = 0

    @render()
    for key in @keys
      socket.add_subscription(key, this)

  render: =>
    super
    @chart = new Chart($("#"+@id)[0].getContext("2d")).Pie(@dataHash(), {animation: false})

  update: (key, newValue) =>
    @values[key] = newValue
    @html.remove()
    @render()

  renderHash: =>
    @mergeHashes super(), {id: @id}

  dataHash: =>
    data = []
    for key, i in @keys
      data.push({value: @values[key], color: @colours[i]})
    data

