function GaugePanel(json, socket, gridster){
  this.html = null;
  this.gauge = null;
  this.socket = socket;
  this.gridster = gridster;
  
  this.sizeX = 2;
  this.sizeY = 2;
  
  this.x = json.x;
  this.y = json.y;

  this.title = json.properties.title || "Title";
  this.min = json.properties.min || 0;
  this.max = json.properties.max || 100;
  
  this.template = HandlebarsTemplates["GaugePanel"];
  
  this.id = generateUUID();
  
  this.render();
  this.socket.add_subscription(json.properties.key, this);
  
  
}

GaugePanel.prototype.render = function(){
  var self = this;
  this.html = this.gridster.add_widget(this.template(self.renderHash()), this.sizeX, this.sizeY, this.x, this.y);
  this.gauge = new JustGage({
    id: this.id,
    title: this.title,
    min: this.min,
    max: this.max
    
  });
};

GaugePanel.prototype.update = function(newValue){
  this.gauge.refresh(newValue);
};

GaugePanel.prototype.renderHash = function(){
  return {id: this.id};
};

function generateUUID(){
    var d = new Date().getTime();
    var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = (d + Math.random()*16)%16 | 0;
        d = Math.floor(d/16);
        return (c=='x' ? r : (r&0x7|0x8)).toString(16);
    });
    return uuid;
}