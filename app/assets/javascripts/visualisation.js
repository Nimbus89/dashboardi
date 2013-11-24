//= require jquery
//= require underscore
//= require backbone
//= require gridster
//= require handlebars
//= require_tree ./templates
//= require_tree ./visualisation

jQuery(function($){
  
  var socket = new Socket(project.protocol, project.connection_address, function(socket){
    var app = new ApplicationController(socket);
  });

  
});