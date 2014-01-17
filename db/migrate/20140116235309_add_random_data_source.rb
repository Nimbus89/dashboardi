class AddRandomDataSource < ActiveRecord::Migration
  def self.up
  	websocket = DataSourceType.create( name: "random" )
  	DataSourceField.create( data_source_type: websocket, name: "key", field_type: "text_field")
  	DataSourceField.create( data_source_type: websocket, name: "min", field_type: "text_field")
  	DataSourceField.create( data_source_type: websocket, name: "max", field_type: "text_field")
  end

  def self.down
  	(DataSourceType.find_by name: "random").data_source_fields.delete_all
  	(DataSourceType.find_by name: "random").destroy
  end
end
