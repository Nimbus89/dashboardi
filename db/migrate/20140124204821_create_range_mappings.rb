class CreateRangeMappings < ActiveRecord::Migration
  def change
    create_table :range_mappings do |t|
      t.string :max_value
      t.string :min_value
      t.string :output_value
      t.references :mapping_function, index: true

      t.timestamps
    end
  end
end
