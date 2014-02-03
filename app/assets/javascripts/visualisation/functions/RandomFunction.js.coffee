class @RandomFunction
	constructor: (fields, socket) ->
		@refresh_rate = 1
		@step_size = Number(fields.step_size)
		@keys = fields.keys
		@max = Number(fields.max)
		@min = Number(fields.min)
		@socket = socket
		if( @max < @min )
			temp = @max
			@max = @min
			@min = temp
		@output_type = fields.output_type
		@vals = @generate_starting_values()
		
		setInterval =>
			@trigger( key ) for key in @keys
		, (@refresh_rate * 1000)

	trigger: ( key ) =>
		if Number(@step_size) isnt 0
			local_max = @vals[key] + @step_size
			local_min = @vals[key] - @step_size
			if(local_max > @max)
				outrange = local_max - @max
				local_max -= outrange
				local_min -= outrange
			if(local_min < @min)
				outrange = @min - local_min
				local_max += outrange
				local_min += outrange
		else
			local_min = @min
			local_max = @max
		new_value = null
		switch @output_type
			when "integer" then new_value = @generate_random_int(local_max, local_min)
			when "boolean" then new_value = @generate_random_bool()
			when "float" then new_value = @generate_random_float(local_max, local_min)
		@socket.trigger_callbacks(key, new_value)
		@vals[key] = new_value
	generate_starting_values: () =>
		values = {}
		start = null
		switch @output_type
			when "integer" then start = (@max + @min) / 2
			when "boolean" then start = true
			when "float" then start = (@max + @min) / 2.0
		for key in @keys
			values[key] = start
			@socket.trigger_callbacks(key, start)
		values
	generate_random_float: (max, min) =>
		range = max - min
		(Math.random() * range) + min

	generate_random_int: (max, min) =>
		range = (max - min) + 1
		Math.floor((Math.random() * range) + min)

	generate_random_bool: () =>
		Math.random() >= 0.5