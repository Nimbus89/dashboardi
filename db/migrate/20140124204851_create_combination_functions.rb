class CreateCombinationFunctions < ActiveRecord::Migration
  def change
    create_table :combination_functions do |t|
      t.text :input_keys
      t.string :output_key
      t.integer :time_range
      t.string :function
      t.references :project, index: true

      t.timestamps
    end
  end
end
