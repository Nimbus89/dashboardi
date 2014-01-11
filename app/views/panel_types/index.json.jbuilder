json.array!(@panel_types) do |panel_type|
  json.extract! panel_type, :name
  json.url panel_type_url(panel_type, format: :json)
end
