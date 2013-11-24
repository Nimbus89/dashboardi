class SseController < ApplicationController
  include ActionController::Live
  
  def random
    
    10.times {
      randomNum = rand(10000);
      sendMessage "key1", randomNum.to_s, "update" 
      puts randomNum.to_s
      sleep 1
    }

  
  ensure
    response.stream.close
  end
  
  def test
    3.times do |n|
      response.stream.write "#{n}...\n\n"
      sleep 2
    end
  ensure
    response.stream.close
  end
  
  private 
  def sendMessage( key, data, event )
    response.stream.write "event: " + event + "\n"
    response.stream.write "data: " + "{\"key\":\"" + key + "\", \"val\":" + data + "}" + "\n\n"
  end
end