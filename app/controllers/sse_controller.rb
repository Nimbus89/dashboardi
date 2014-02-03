class SseController < ApplicationController
  include ActionController::Live
  require 'net/ping'
  
  def oldRandom
    response.headers['Content-Type'] = 'text/event-stream'
    30.times do
      randomNum1 = rand(10000);
      randomNum2 = rand(100);
      randomNum3 = rand(2);
      sendMessage "key1", randomNum1.to_s, "update" 
      sendMessage "key2", randomNum2.to_s, "update" 
      sendMessage "key3", randomNum3.to_s, "update" 
      sleep 0.5
    end
  
  ensure
    response.stream.close
  end

  def ping
    source = DataSource.find(params[:source_id])
    response.headers['Content-Type'] = 'text/event-stream'
    1.times do
      source.fields['addresses'].each do |address|
        ph = Net::Ping::HTTP.new(address)
        sendMessage address, ph.ping?.to_s, "update"
      end
      sleep 5
    end
  
  ensure
    response.stream.close
  end
  
  private 
  def sendMessage( key, data, event )
    response.stream.write "event: " + event + "\n"
    response.stream.write "data: " + "{\"key\":\"" + key + "\", \"val\":\"" + data + "\"}" + "\n\n"
  end
end