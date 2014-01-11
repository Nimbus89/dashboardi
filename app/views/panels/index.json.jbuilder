json.array!(@panels) do |panel|
  json.extract! panel, 
  json.url panel_url(panel, format: :json)
end
