json.array!(@projects) do |project|
  json.extract! project, :name, :date_created, :last_modified, :description, :user_id
  json.url project_url(project, format: :json)
end
