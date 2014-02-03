class @MappingFunction
	constructor: (socket, json) ->
		@socket = socket
		@output_key = json.output_key
		@input_key = json.input_key
		@default_value = json.default_value
		@range_mappings = json.range_mappings
		@socket.add_subscription(@input_key, this)
	update: (key, newValue) =>
		value = @default_value
		i = 0
		done = false
		while @range_mappings[i]? && !done
			if Number(newValue) <= Number(@range_mappings[i].max_value) && Number(newValue) >= Number(@range_mappings[i].min_value)
				done = true
				value = @range_mappings[i].output_value
			i++
		@socket.trigger_callbacks(@output_key, value)