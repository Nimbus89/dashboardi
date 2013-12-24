module EditorHelper

	def render_palette_item(item)
		render partial: "/editor/palette_items/#{item.name}"
	end

	def render_workspace_panel(item)
		render partial: "/editor/panel", locals: {panel: item}
	end
end
