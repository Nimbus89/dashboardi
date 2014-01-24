class @ErrorHandler
	constructor: () ->

	handle: (errorMessage) =>
		$("<p>" + errorMessage + "</p>").purr()