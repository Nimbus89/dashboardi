class @Socket
  constructor: (protocol, http, cb) ->
    @protocol = protocol
    @subscriptions = {}

    if @protocol is "websocket"
      @websocket = new WebSocket(http)
      setTimeout(testready,500)
      @websocket.onmessage = (evt) => @process_websocket_message(evt)
    else if @protocol is "sse"
      @source = new EventSource(http)
      @source.addEventListener("update", (e) =>
        @process_sse_message(e.data)
      )
      cb(this)
    else
      cb(this)
  
  testready: =>
    if @websocket.readyState is 1 then cb(this) else setTimeout(testready, 500)

  process_websocket_message: (evt) =>
    obj = JSON.parse(evt.data)
    @trigger_callbacks(obj.key, obj.value)

  process_sse_message: (evt) =>
    obj = JSON.parse(evt)
    @trigger_callbacks(obj.key, obj.val)

  clear_subscriptions: =>
    @subscriptions = {}

  add_subscription: (key, subscriber) =>
    @subscriptions[key] = [] if !@subscriptions[key]?
    @subscriptions[key].push(subscriber);

  trigger_callbacks: (key, data) =>
    if @subscriptions[key]?
      for subscriber in @subscriptions[key]
        subscriber.update(key, data)
