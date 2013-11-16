function NavButtonPanel(json, app, gridster){
  
  this.sizeX = 3;
  this.sizeY = 2;
  
  this.x = json.x;
  this.y = json.y;
  
  this.app = app;
  this.text = json.properties.link_text;
  this.ref = json.properties.navagate_to;
  this.gridster = gridster;
  this.template = HandlebarsTemplates["NavButtonPanel"];
  
  this.render();
}

NavButtonPanel.prototype.render = function(){
  var self = this;
  this.html = this.gridster.add_widget(this.template(self.renderHash()), this.sizeX, this.sizeY, this.x, this.y);
  this.html.click(function(){
    self.app.changePage(self.ref);
  });
}

NavButtonPanel.prototype.renderHash = function(){
  return {text: this.text};
}