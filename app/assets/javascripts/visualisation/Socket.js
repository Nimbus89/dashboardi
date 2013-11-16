  function Socket(http, cb){
    var self = this;
    self.websocket = new WebSocket(http);
    self.subscriptions = {};
    
    setTimeout(testready,500);
    
    function testready(){
      if(self.websocket.readyState===1){
        cb();
      }
      else{
        setTimeout(testready,500);
      }
    }
    self.websocket.onmessage = function(evt){self.process_message(evt);};
    
  }
  
  Socket.prototype.process_message = function(evt){
    var obj = JSON.parse(evt.data);
    this.trigger_callbacks(obj.key, obj.data);
  }
  
  Socket.prototype.clear_subscriptions = function(){
    this.subscriptions = {};
  }
  
  Socket.prototype.add_subscription = function(key, callback) {
    if(this.subscriptions[key] === null || this.subscriptions[key] === undefined){
      this.subscriptions[key] = [];
    }
    this.subscriptions[key].push(callback);
  }
  
  Socket.prototype.trigger_callbacks = function(key, data){
    for(var i = 0; i < this.subscriptions[key].length; i++){
      this.subscriptions[key][i](data);
    }
  }
  
  Socket.prototype.send_message = function(string){
    this.websocket.send(string);
  }