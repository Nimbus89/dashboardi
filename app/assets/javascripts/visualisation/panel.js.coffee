class @Panel
	constructor: (json, app, socket, templateName) ->
		@html = null

		@socket = socket
		@app = app

		@x = json.x
		@y = json.y

		if json.sizeX == 0 && json.sizeY == 0
			if json.properties['width']? && json.properties['height']?
				@sizeX = ((Number) json.properties['width']) * 20
				@sizeY = ((Number) json.properties['height']) * 20
			else
				@sizeX = ((Number) json.properties['size']) * 20
				@sizeY = ((Number) json.properties['size']) * 20
		else
			@sizeX = json.sizeX
			@sizeY = json.sizeY
			


		@template = HandlebarsTemplates[templateName]
	render: =>
		@html = $(@template(@renderHash()))
		$(".page").append(@html)
	renderHash: =>
		{x: @x, y: @y, sizeX: @sizeX, sizeY: @sizeY}
	mergeHashes: (hash1, hash2) =>
		for key, item of hash2
			hash1[key] = item
		hash1
	s4: () =>
  		Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1)
  	generateUUID: () =>
  		@s4() + @s4() + '-' + @s4() + '-' + @s4() + '-' + @s4() + '-' + @s4() + @s4() + @s4()
