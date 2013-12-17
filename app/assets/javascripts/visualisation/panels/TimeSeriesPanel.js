function TimeSeriesPanel(json, socket, gridster){

	this.template = HandlebarsTemplates["TimeSeriesPanel"];
	this.plot= null;
	this.html = null;
	this.data = [];
	this.options = json.properties.options || {};
	this.inData = null;
	this.sizeX = 5;
	this.sizeY = 3;

	this.x = json.x;
	this.y = json.y;

	this.refreshRate = json.properties.refreshRate;
	this.resolution = json.properties.resolution;
	this.yMax = json.properties.yMax;
	this.yMin = json.properties.yMin;

	this.gridster = gridster;

	this.render();

	socket.add_subscription(json.properties.key, this);
}

TimeSeriesPanel.prototype.render = function(){
	var self = this;
	while(this.data.length < this.resolution){
		this.data.push(this.yMin);
	}
	self.html = self.gridster.add_widget(self.template(self.renderHash()), this.sizeX, this.sizeY, this.x, this.y);
	this.plot = $.plot($(self.html), this.generatePoints(), this.options);
	this.interval = setInterval((function(self){return function(){self.rerender();}})(this), this.refreshRate, this);

}

TimeSeriesPanel.prototype.renderHash = function(){
  return {};
};

TimeSeriesPanel.prototype.update = function(newData){
  this.inData = newData;
};

TimeSeriesPanel.prototype.rerender = function(){
	var self = this;
	var newpoint = null;
	if(self.inData !== null){
		newpoint = self.inData;
		self.inData = null;
	} else {
		newpoint = self.data[self.resolution - 1];
	}


	self.data = self.data.slice(1);
	self.data.push(newpoint);

	self.plot.setData(self.generatePoints());
	self.plot.draw();
};


TimeSeriesPanel.prototype.generatePoints = function(){
	var res = [];
	for (var i = 0; i < this.data.length; i++){
		res.push([i, this.data[i]]);
	}
	return res;
}
