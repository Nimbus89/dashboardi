class CreateDataSourceFields < ActiveRecord::Migration
  def change
    create_table :data_source_fields do |t|
      t.string :name
      t.string :field_type
      t.references :data_source_type, index: true

      t.timestamps
    end
  end
end
