class CreateDataSourceTypes < ActiveRecord::Migration
  def change
    create_table :data_source_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
