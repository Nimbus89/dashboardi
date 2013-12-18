json.extract! @project, :protocol, :connection_address

json.pages @project.pages do |json, page|
	json.page :name
	json.panels page.panels do |json, panel|
		json.(panel, :x, :y)
		json.type panel.panel_type.name
		json.(panel, :properties)
	end
end