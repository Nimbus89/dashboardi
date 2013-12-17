class CreatePanelFields < ActiveRecord::Migration
  def change
    create_table :panel_fields do |t|
      t.string :name
      t.string :field_type
      t.belongs_to :panel_type, index: true

      t.timestamps
    end
  end
end
