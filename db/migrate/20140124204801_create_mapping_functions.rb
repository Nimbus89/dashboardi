class CreateMappingFunctions < ActiveRecord::Migration
  def change
    create_table :mapping_functions do |t|
      t.string :input_key
      t.string :output_key
      t.string :default_value
      t.references :project, index: true

      t.timestamps
    end
  end
end
