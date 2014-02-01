class CreateInputKeys < ActiveRecord::Migration
  def change
    create_table :input_keys do |t|
      t.string :key
      t.references :combination_function, index: true

      t.timestamps
    end

    remove_column :combination_functions, :input_keys
  end
end
