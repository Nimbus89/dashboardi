function PanelFactory(gridster, socket, app){
  this.gridster = gridster;
  this.socket = socket;
  this.app = app;
}

PanelFactory.prototype.create = function(json){
  
  var panel = null;
  
  switch(json.type)
  {
    case "value":
      panel = new ValuePanel(json, this.socket, this.gridster);
      break;
    case "navbutton":
      panel = new NavButtonPanel(json, this.app, this.gridster);
      break;
    default:
      alert("Unknown panel type: " + json.type);
  }
  
  return panel;
}