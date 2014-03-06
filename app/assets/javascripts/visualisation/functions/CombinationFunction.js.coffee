class @CombinationFunction
	constructor: (socket, json) ->
		@socket = socket
		@output_key = json.output_key
		@time_range = Number(json.time_range)
		@function = json.function
		@input_keys = json.input_keys
		@values = {}
		for input_key in @input_keys
			@socket.add_subscription(input_key, this)
	output: (newValue) =>
		@socket.trigger_callbacks(@output_key, newValue)
	update: (key, newValue) =>
		if(@time_range == 0)
			@values[key] = newValue
			@output( @calculate_answer(@generate_values_array()) )
		else
			time = new Date().getTime()
			@values[time] = newValue
			value_array = []
			for key, value of @values
				value_array.push( value )
			@output( @calculate_answer(@generate_values_array()) )
			window.setTimeout(()=>
				delete @values[time]
				@output( @calculate_answer(@generate_values_array()) )
			,@time_range, time)
	generate_values_array: () =>
		value_array = []
		for key, value of @values
			value_array.push( value )
		@output( @calculate_answer(value_array) )
		value_array
	calculate_answer: (value_array) =>
		switch @function
			when "Sum"
				value_array.reduce((a, b) -> Number(a) + Number(b) )
			when "Maximum"
				value_array.reduce((a, b) -> if Number(a) > Number(b) then Number(a) else Number(b) )
			when "Minimum"
				value_array.reduce((a, b) -> if Number(a) < Number(b) then Number(a) else Number(b) )
			when "Average"
				value_array.reduce((a, b) -> Number(a) + Number(b) ) / value_array.length