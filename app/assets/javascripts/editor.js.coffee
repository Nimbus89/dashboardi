# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery
//= require jquery_ujs
//= require gridster
//= require jquery-ui
//= require jquery.ui-contextmenu
//= require spectrum

//= require_tree "./editor"


jQuery(($) -> 

	$(".properties").on("click", ".add_fields_dyn", (event) ->
		$(this).before($(this).data('fields'));
		$(".properties_form input.color").spectrum();
		event.preventDefault();
	)

	$(".properties").on("click", ".remove_fields_dyn", (event) ->
		$(this).parent().remove();
		$(this).remove();
		event.preventDefault();
	)

	$(".properties").on("blur", "input", (event) ->
		$(this).closest("form").submit()
	)

	content = ->
        element = $( this )
        element.data("content")

    $( document ).tooltip({items: ".palette_item", content: content, show:false, hide:false, relative:true, position: {my: "left bottom", at: "right top"}})

	window.app = new ApplicationController()
)