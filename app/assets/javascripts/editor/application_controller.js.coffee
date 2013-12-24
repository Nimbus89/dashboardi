class @ApplicationController
	constructor: ->
		@gridster = $(".workspace").gridster({
			widget_margins: [10, 10],
			widget_base_dimensions: [80, 80],
			widget_selector: "div"
		})
