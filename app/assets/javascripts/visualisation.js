//= require jquery
//= require underscore
//= require backbone
//= require gridster
//= require handlebars

//= require raphael
//= require justgauge
//= require jquery.flot


//= require_tree ./templates
//= require_tree ./visualisation

jQuery(function($){
  
  var socket = new Socket(project.protocol, project.connection_address, function(socket){
    var app = new ApplicationController(socket);
  });

  
});