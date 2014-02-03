class @ComparisonFunction
	constructor: (socket, json) ->
		@socket = socket
		@output_key = json.output_key
		@input_key = json.input_key
		@constant = json.constant
		@second_input = json.second_input
		@function = json.function
		@socket.add_subscription(@input_key, this)
		if @constant
			@second_value = Number( @second_input ) 
		else
			@socket.add_subscription(@second_input, this)

	update: (key, newValue) =>
		if(key == @input_key)
			@first_value = newValue
		else if(key == @second_input && !@constant)
			@second_value = newValue


		switch @function
			when "gt" then @output(@first_value > @second_value)
			when "gte" then @output(@first_value >= @second_value)
			when "lt" then @output(@first_value < @second_value)
			when "lte" then @output(@first_value <= @second_value)
			when "eq" then @output(@first_value == @second_value)
			when "neq" then @output(@first_value != @second_value)
	output: (newValue) =>
		@socket.trigger_callbacks(@output_key, newValue)

