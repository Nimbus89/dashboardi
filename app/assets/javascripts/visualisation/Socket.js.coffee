class @Socket

  @WEBSOCKET_RETRY_DELAY: 500
  @WEBSOCKET_RETRY_COUNT: 10

  constructor: (project, eHandler) ->
    @eHandler = eHandler
    @id = project.id
    @dataSources = project.data_sources
    @subscriptions = {}
    @hasRandom = false


    for dataSource in @dataSources
      if dataSource.type is "websocket"
        websocket = new WebSocket(dataSource.fields.address)
        setTimeout(()->
          testReady(websocket, 0)
        , @WEBSOCKET_RETRY_DELAY)

      if dataSource.type is "server sent events"
        source = new EventSource(dataSource.fields.address)
        source.addEventListener("update", (e) =>
          @process_sse_message(e.data)
        )
        source.onError = (e) =>
          @eHandler.handle("Cannot Connect to SSE source: " + source )
      if dataSource.type is "random" && not @hasRandom
        @hasRandom = true
        source = new EventSource("/sse/random/" + @id)
        source.addEventListener("update", (e) =>
          @process_sse_message(e.data)
        )
    # if @protocol is "websocket"
    #   @websocket = new WebSocket(http)
    #   setTimeout(testready,500)
    #   @websocket.onmessage = (evt) => @process_websocket_message(evt)
    # else if @protocol is "sse"
    #   @source = new EventSource(http)
    #   @source.addEventListener("update", (e) =>
    #     @process_sse_message(e.data)
    #   )
    #   cb(this)
    # else
    #   cb(this)


  
  testReady: (websocket, retryCount) =>
    if(retryCount < @WEBSOCKET_RETRY_COUNT)
      if @websocket.readyState is 1
        websocket.onmessage = (evt) => @process_websocket_message(evt)
      else
        setTimeout(()->
          testReady(websocket, retryCount + 1)
        , @WEBSOCKET_RETRY_DELAY)
    else
      @eHandler.handle("Error: Cannot connect to websocket: " + websocket)

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
