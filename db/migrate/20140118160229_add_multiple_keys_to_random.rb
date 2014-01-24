class AddMultipleKeysToRandom < ActiveRecord::Migration
  def self.up
  	rand = DataSourceType.find_by name: "random"
  	(rand.data_source_fields.find_by name: "key").destroy
  	DataSourceField.create( data_source_type: rand, name: "keys", field_type: "string_array")
  end

  def self.down
  	rand = DataSourceType.find_by name: "random"
  	(rand.data_source_fields.find_by name: "keys").destroy
  	DataSourceField.create( data_source_type: rand, name: "key", field_type: "text_field")
  end
end
