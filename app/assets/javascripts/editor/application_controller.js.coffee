class @ApplicationController
	constructor: ->
		@pageID = $(".workspace").data("pageid")

		@bind_panels()

		@bind_palette_drop()

	edit_panel: (panel_id, info_hash) =>
		$.ajax({
			type: "PATCH",
			url: '/panels/' + panel_id + '.json',
			data: JSON.stringify(info_hash),
			contentType: 'application/json',
			dataType: 'json',
			success: (msg) ->
				console.log msg
		})
	new_panel: (info_hash) =>
		$.ajax({
			type: "POST",
			url: '/panels/',
			data: JSON.stringify(info_hash),
			contentType: 'application/json',
			dataType: 'script',
			success: (msg) ->
				console.log msg
		})
	delete_panel: (panel_id) =>
		$.ajax({
			type: "POST",
			url: '/panels/' + panel_id,
			data: {"_method":"delete"},
			dataType: 'script',
			success: (msg) ->
				console.log msg
		})
	bind_panels: =>
		self = this
		$(".workspace .panel").draggable({ grid: [20,20], containment: "parent" })
		$(".workspace .panel").on("dragstop", (event, ui) ->
			id = $(this).data("panelid")
			panel_info = { panel : {x: ui.position.left, y: ui.position.top} }
			self.edit_panel(id, panel_info)
		)
		$(".workspace .panel").on("click", (event, ui) ->
			id = $(this).data("panelid")
			self.select_panel(id)
		)
		$(".workspace").contextmenu({
			delegate: ".panel",
			menu: [
				{title: "Delete", action: (event, ui) ->
					self.delete_panel(ui.target.closest(".panel").data("panelid"))
				}
			]
		})
	bind_palette_drop: =>
		$(".palette .palette_item").draggable({ helper: "clone" })
		$(".workspace").droppable({ accept: ".palette_item" })
		$(".workspace").on("drop", (event, ui) =>
			panel_type_id = ui.draggable[0].dataset.paneltype
			x = ui.offset.left - (ui.offset.left % 20) 
			y = ui.offset.top - (ui.offset.top % 20) 
			@new_panel({ panel: { x: x, y: y, panel_type_id: panel_type_id, page_id: @pageID } })
		)
	select_panel: (panel_id) =>
		$.ajax({
			type: "GET",
			url: '/panels/' + panel_id + '/edit',
			data: {},
			contentType: 'application/json',
			dataType: 'script',
			success: (msg) ->
				console.log msg
		})
