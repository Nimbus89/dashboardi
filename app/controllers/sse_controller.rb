class SseController < ApplicationController
  include ActionController::Live
  
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

  def random
    project = Project.find(params[:project_id])
    rand = DataSourceType.find_by name: "random"
    rand_sources = project.data_sources.where data_source_type_id: rand.id
    response.headers['Content-Type'] = 'text/event-stream'
    30.times do
      rand_sources.each do |source|
        rand_num = rand(source.fields['max'].to_i - source.fields['min'].to_i) + source.fields['min'].to_i
        sendMessage source.fields['key'], rand_num.to_s, "update"
      end
      sleep 0.5
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