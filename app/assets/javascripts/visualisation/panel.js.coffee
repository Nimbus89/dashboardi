class @Panel
	constructor: (json, gridster, app, socket, templateName) ->
		@html = null

		@socket = socket
		@app = app
		@gridster = gridster

		@x = json.x
		@y = json.y

		@template = HandlebarsTemplates[templateName]
	render: =>
		@html = this.gridster.add_widget(this.template(this.renderHash()), this.sizeX, this.sizeY, this.x, this.y);
	renderHash: =>
		{}