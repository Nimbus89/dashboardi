class CreateComparisonFunctions < ActiveRecord::Migration
  def change
    create_table :comparison_functions do |t|
      t.boolean :constant
      t.string :input_key
      t.string :second_input
      t.string :function
      t.string :output_key
      t.references :project, index: true

      t.timestamps
    end
  end
end
