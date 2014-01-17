class AddHttpPingDataSource < ActiveRecord::Migration
  def self.up
  	ping = DataSourceType.create( name: "HTTP ping" )
  	DataSourceField.create( data_source_type: ping, name: "addresses", field_type: "string_array")
  end

  def self.down
  	(DataSourceType.find_by name: "HTTP ping").data_source_fields.delete_all
  	(DataSourceType.find_by name: "HTTP ping").destroy
  end
end
