json.array!(@comparison_functions) do |comparison_function|
  json.extract! comparison_function, :id, :constant, :input_key, :second_input, :function, :output_key, :project_id
  json.url comparison_function_url(comparison_function, format: :json)
end
