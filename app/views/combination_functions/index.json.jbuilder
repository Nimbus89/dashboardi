json.array!(@combination_functions) do |combination_function|
  json.extract! combination_function, :id, :input_keys, :output_key, :time_range, :function, :project_id
  json.url combination_function_url(combination_function, format: :json)
end
