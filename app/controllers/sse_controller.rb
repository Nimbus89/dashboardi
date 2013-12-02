class SseController < ApplicationController
  include ActionController::Live
  
  def random
    response.headers['Content-Type'] = 'text/event-stream'
      randomNum = rand(10000);
      sendMessage "key1", randomNum.to_s, "update" 
      puts randomNum.to_s

  
  ensure
    response.stream.close
  end
  
  private 
  def sendMessage( key, data, event )
    response.stream.write "event: " + event + "\n"
    response.stream.write "data: " + "{\"key\":\"" + key + "\", \"val\":" + data + "}" + "\n\n"
  end
end