class AddTypeToPanels < ActiveRecord::Migration
  def change
    add_column :panels, :panel_type_id, :integer
    add_column :panels, :properties, :text
  end
end
