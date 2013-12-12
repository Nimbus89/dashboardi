  function Socket(protocol, http, cb){
    var self = this;
    self.protocol = protocol;
    self.subscriptions = {};
    
    if(self.protocol === "websocket"){
      self.websocket = new WebSocket(http);
      setTimeout(testready,500);
      self.websocket.onmessage = function(evt){self.process_websocket_message(evt);};
      
    } else if(self.protocol === "sse"){
      self.source = new EventSource('/sse/random');
      self.source.addEventListener("update", function(e){
        self.process_sse_message(e.data);
      });
      cb(self);
    }
    
      function testready(){
        if(self.websocket.readyState===1){
          cb(self);
        }
        else{
          setTimeout(testready,500);
        }
      }
    

    
  }
  
  Socket.prototype.process_websocket_message = function(evt){
    var obj = JSON.parse(evt.data);
    this.trigger_callbacks(obj.key, obj.val);
  }
  
  Socket.prototype.process_sse_message = function(evt){
    var obj = JSON.parse(evt);
    this.trigger_callbacks(obj.key, obj.val);
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
      this.subscriptions[key][i].update(data);
    }
  }
  
  Socket.prototype.send_message = function(string){
    this.websocket.send(string);
  }