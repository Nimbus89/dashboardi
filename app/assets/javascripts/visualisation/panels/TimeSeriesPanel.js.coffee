class @TimeSeriesPanel extends @Panel
	constructor: (json, app, socket, gridster) ->
		super(json, gridster, app, socket, "TimeSeriesPanel")
		@plot = null
		@inData = null
		@data = []
		@options = json.properties.options || {}
		@refreshRate = json.properties.refreshRate
		@resolution = json.properties.resolution
		@yMax = json.properties.ymax
		@yMin = json.properties.ymin

		@sizeX = 5
		@sizeY = 3

		@options.yaxis = {min: @yMin, max: @yMax}

		@render()

		socket.add_subscription(json.properties.key, this)

	render: =>
		super()
		@data.push(@yMin) while @data.length < @resolution
		@plot = $.plot($(@html), @generatePoints(), @options)
		@interval = setInterval =>
			@rerender()
		, @refreshRate

	update: (key, newValue) =>
		@inData = newValue

	rerender: =>
		newpoint = null
		if @inData isnt null
			newpoint = @inData
			@inData = null
		else
			newpoint = @data[@resolution - 1]

		@data = @data.slice(1)
		@data.push(newpoint)

		@plot.setData(@generatePoints())
		@plot.draw()

	generatePoints: =>
		lines = []
		res = []
		res.push([i, point]) for point, i in @data
		lines.push(res);
		lines