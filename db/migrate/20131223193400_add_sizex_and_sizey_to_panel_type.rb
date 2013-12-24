class AddSizexAndSizeyToPanelType < ActiveRecord::Migration
  def change
    add_column :panel_types, :sizex, :integer
    add_column :panel_types, :sizey, :integer
  end
end
