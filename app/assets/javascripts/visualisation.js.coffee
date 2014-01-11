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

jQuery(($) -> 
  socket = new window.Socket(project.protocol, project.connection_address, (socket) ->
    app = new window.ApplicationController(socket);
  )
)