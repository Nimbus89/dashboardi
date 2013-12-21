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
	generateUUID: =>
		d = new Date().getTime()
		'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) ->
		    r = (d + Math.random()*16)%16 | 0
		    d = Math.floor(d/16)
		    (c=='x' ? r : (r&0x7|0x8)).toString(16)
		)