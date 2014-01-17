# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery
//= require jquery_ujs
//= require gridster
//= require jquery-ui
//= require jquery.ui-contextmenu

//= require_tree "./editor"


jQuery(($) -> 

	$(".properties").on("click", ".add_fields_dyn", (event) ->
		$(this).before($(this).data('fields'));
		event.preventDefault();
	)

	$(".properties").on("click", ".remove_fields_dyn", (event) ->
		$(this).parent().remove();
		$(this).remove();
		event.preventDefault();
	)
	window.app = new ApplicationController()
)