class @TimeSeriesPanel extends @Panel
	constructor: (json, app, socket) ->
		super(json, app, socket, "TimeSeriesPanel")
		@keys = json.properties.keys || []
		@plot = null
		@inDatas = []
		@datas = []
		for key in @keys
			@datas[key] = [] 
		@options = json.properties.options || {}
		@refreshRate = json.properties.refreshRate
		@resolution = json.properties.resolution
		@yMax = json.properties.ymax
		@yMin = json.properties.ymin

		@options.yaxis = {min: @yMin, max: @yMax}

		@render()

		for key in @keys
			socket.add_subscription(key, this)

	render: =>
		super()
		for key in @keys
			@datas[key].push(@yMin) while @datas[key].length < @resolution 
		@plot = $.plot($(@html), @generatePoints(), @options)
		@interval = setInterval =>
			@rerender()
		, @refreshRate

	update: (key, newValue) =>
		@inDatas[key] = newValue

	rerender: =>
		
		for key in @keys
			newpoint = null
			if @inDatas[key]?
				newpoint = @inDatas[key]
				@inDatas[key] = null
			else
				newpoint = @datas[key][@resolution - 1]

			@datas[key] = @datas[key].slice(1)
			@datas[key].push(newpoint)

		@plot.setData(@generatePoints())
		@plot.draw()

	generatePoints: =>
		lines = []
		for key in @keys
			res = []
			res.push([i, point]) for point, i in @datas[key]
			lines.push(res);
		lines