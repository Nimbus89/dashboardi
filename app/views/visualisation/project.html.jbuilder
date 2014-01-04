json.extract! @project, :protocol, :connection_address

json.pages @project.pages do |json, page|
	json.name page.name
	json.panels page.panels do |json, panel|
		json.(panel, :x, :y)
		json.sizeX panel.panel_type.sizex
		json.sizeY panel.panel_type.sizey
		json.type panel.panel_type.name
		json.(panel, :properties)
	end
end