class AddTypeAndStepSizeToRandom < ActiveRecord::Migration
  def self.up
  	random = DataSourceType.find_by name: "random"
  	DataSourceField.create( data_source_type: random, name: "step_size", field_type: "text_field")
  	DataSourceField.create( data_source_type: random, name: "output_type", field_type: "type_select")
  end

  def self.down
  	random = DataSourceType.find_by name: "random"
  	(random.data_source_fields.find_by name: "step_size").destroy
  	(random.data_source_fields.find_by name: "output_type").destroy
  end
end
