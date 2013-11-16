//= require jquery
//= require underscore
//= require backbone
//= require gridster
//= require handlebars
//= require_tree ./templates
//= require_tree ./visualisation

jQuery(function($){
  
  var socket = new Socket("ws://echo.websocket.org", function(){
    var app = new ApplicationController(socket);
  });

  
});