//= require jquery
//= require underscore
//= require backbone
//= require gridster
//= require handlebars
//= require_tree ./templates
//= require_tree ./visualisation

jQuery(function($){
  
  var socket = new Socket(project.websocket_address, function(){
    var app = new ApplicationController(socket);
  });

  
});