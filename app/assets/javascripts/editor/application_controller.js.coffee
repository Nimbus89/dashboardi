class @ApplicationController
	constructor: ->
		#@gridster = $(".workspace").gridster({
		#	widget_margins: [10, 10],
		#	widget_base_dimensions: [80, 80],
		#	widget_selector: "div"
		#})
		$(".workspace .panel").draggable({ grid: [20,20], containment: "parent" })
		$(".workspace .panel").on("dragstop", (event, ui) ->
			id = $(this).data("panelid")
			panel_info = { panel : {x: ui.position.left, y: ui.position.top} }
			

			$.ajax({
				type: "PATCH",
				url: '/panels/' + id+ '.json',
				data: JSON.stringify(panel_info),
				contentType: 'application/json',
				dataType: 'json',
				success: (msg) ->
					console.log msg
			})
		)
