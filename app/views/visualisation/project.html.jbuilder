json.extract! @project, :data_sources, :id
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

json.set! :pages do
	@project.pages.each do |page|
		json.set! page.id do

			json.name page.name

			json.set! :panels do
				page.panels.each do |panel|
					json.set! panel.id do
						json.id panel.id
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