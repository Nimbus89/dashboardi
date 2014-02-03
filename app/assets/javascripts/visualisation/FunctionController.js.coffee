class @FunctionController
	constructor: (project, socket) ->
		@mapping_json = project.mapping_functions
		@comparison_json = project.comparison_functions
		@combination_json = project.combination_functions
		@socket = socket

		for function_json in @mapping_json
			new window.MappingFunction(@socket, function_json)

		for function_json in @comparison_json
			new window.ComparisonFunction(@socket, function_json)

		for function_json in @combination_json
			new window.CombinationFunction(@socket, function_json)

		for data_source in project.data_sources
			if data_source['type'] == "random"
				new window.RandomFunction(data_source.fields, socket)