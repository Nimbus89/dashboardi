// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.purr
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require best_in_place
//= require best_in_place.purr
//= require projects


jQuery(function($){
	$(".dyn_fields").on("click", ".add_fields_dyn", function(event){
		$(this).before($(this).data('fields'));
		event.preventDefault();
	});

	$(".dyn_fields").on("click", ".remove_fields_dyn", function(event){
		$(this).parent().remove();
		$(this).remove();
		event.preventDefault();
	});
})

$(document).on("page:load", function(){
	$(".dyn_fields").on("click", ".add_fields_dyn", function(event){
		$(this).before($(this).data('fields'));
		event.preventDefault();
	});

	$(".dyn_fields").on("click", ".remove_fields_dyn", function(event){
		$(this).parent().remove();
		$(this).remove();
		event.preventDefault();
	});
})
