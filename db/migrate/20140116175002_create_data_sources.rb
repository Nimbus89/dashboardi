class CreateDataSources < ActiveRecord::Migration
  def change
    create_table :data_sources do |t|
      t.references :data_source_type, index: true
      t.references :project, index: true
      t.text :fields

      t.timestamps
    end
  end
end
