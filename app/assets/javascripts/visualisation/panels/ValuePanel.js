function ValuePanel(json, socket, gridster){
  this.html = null;
  this.socket = socket;
  this.gridster = gridster;
  
  this.sizeX = 3;
  this.sizeY = 2;
  
  this.x = json.x;
  this.y = json.y;

  this.title = json.properties.title;
  this.unit = json.properties.unit;
  this.currentValue = json.properties.default || 0;
  
  this.template = HandlebarsTemplates["ValuePanel"];
  this.render();
  this.socket.add_subscription(json.properties.key, this.update);
}

ValuePanel.prototype.render = function(){
  var self = this;
  this.html = this.gridster.add_widget(this.template(self.renderHash()), this.sizeX, this.sizeY, this.x, this.y);
};

ValuePanel.prototype.update = function(newValue){
  this.currentValue = newValue;
  this.html.html(this.template(this.renderHash()));
};

ValuePanel.prototype.renderHash = function(){
  return {value:this.currentValue, title:this.title, unit:this.unit};
};