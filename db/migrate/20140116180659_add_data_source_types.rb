class AddDataSourceTypes < ActiveRecord::Migration
  def self.up
  	websocket = DataSourceType.create( name: "websocket" )
  	DataSourceField.create( data_source_type: websocket, name: "address", field_type: "text_field")

  	sse = DataSourceType.create( name: "server sent events" )
  	DataSourceField.create( data_source_type: sse, name: "address", field_type: "text_field")


  end

  def self.down
  	DataSourceType.delete_all
  	DataSourceField.delete_all
  end
end
