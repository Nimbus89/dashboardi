class @Panel
	constructor: (json, app, socket, templateName) ->
		@html = null

		@socket = socket
		@app = app

		@x = json.x
		@y = json.y
		@sizeX = json.sizeX
		@sizeY = json.sizeY


		@template = HandlebarsTemplates[templateName]
	render: =>
		@html = $(@template(@renderHash()))
		$(".page").append(@html)
	renderHash: =>
		{x: @x, y: @y, sizeX: @sizeX, sizeY: @sizeY}
	generateUUID: =>
		d = new Date().getTime()
		'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) ->
		    r = (d + Math.random()*16)%16 | 0
		    d = Math.floor(d/16)
		    (c=='x' ? r : (r&0x7|0x8)).toString(16)
		)
	mergeHashes: (hash1, hash2) =>
		for key, item of hash2
			hash1[key] = item
		hash1