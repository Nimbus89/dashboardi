json.extract! @project, :data_sources, :id, :background_colour, :foreground_colour, :panel_colour, :text_colour
json.startpage_id @startpage_id
json.screensize_x @project.screensize_x
json.screensize_y @project.screensize_y

json.data_sources do
	json.array! @project.data_sources do |source|
		json.type source.data_source_type.name
		json.fields source.fields
		json.id source.id
	end
end

json.combination_functions do
	json.array! @project.combination_functions do |function|
		json.output_key function.output_key
		json.time_range function.time_range
		json.function function.function
		json.input_keys do
			json.array! function.input_keys.collect { |key| key.key }
		end
	end
end

json.comparison_functions do
	json.array! @project.comparison_functions do |function|
		json.output_key function.output_key
		json.input_key function.input_key
		json.function function.function
		json.constant function.constant
		json.second_input function.second_input
	end
end

json.mapping_functions do
	json.array! @project.mapping_functions do |function|
		json.output_key function.output_key
		json.input_key function.input_key
		json.default_value function.default_value
		json.range_mappings do
			json.array! function.range_mappings do |range_mapping|
				json.max_value range_mapping.max_value
				json.min_value range_mapping.min_value
				json.output_value range_mapping.output_value
			end
		end
	end
end

json.set! :pages do
	@pages.each do |page|
		json.set! page.id do

			json.name page.name

			json.set! :panels do
			panels = page.panels.includes(:panel_type)
				panels.each do |panel|
					json.set! panel.id do
						json.id panel.id
						json.text_colour @project.text_colour
						json.background_colour @project.panel_colour
						json.(panel, :x, :y)
						json.sizeX panel.panel_type.sizex
						json.sizeY panel.panel_type.sizey
						json.type panel.panel_type.name
						json.(panel, :properties)
					end
				end
			end
		end
	end
end