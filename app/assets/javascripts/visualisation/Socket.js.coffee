class @Socket



  constructor: (project, eHandler) ->

    @WEBSOCKET_RETRY_DELAY = 5000
    @WEBSOCKET_RETRY_COUNT = 30

    @eHandler = eHandler
    @id = project.id
    @dataSources = project.data_sources
    @subscriptions = {}
    @hasRandom = false


    for dataSource in @dataSources
      try
        if dataSource.type is "websocket"
          websocket = new WebSocket(dataSource.fields.address, "visu")
          setTimeout(()=>
            @testReady(websocket, 0)
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
        if dataSource.type is "HTTP ping"
          @hasRandom = true
          source = new EventSource("/sse/ping/" + dataSource.id)
          source.addEventListener("update", (e) =>
            @process_sse_message(e.data)
          )
      catch err
        @eHandler.handle(err)

      



  
  testReady: (websocket, retryCount) =>
    if(retryCount < @WEBSOCKET_RETRY_COUNT)
      if websocket.readyState is 1
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
