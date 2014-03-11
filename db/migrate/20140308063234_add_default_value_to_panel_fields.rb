class AddDefaultValueToPanelFields < ActiveRecord::Migration
  def change
  	add_column :panel_fields, :default_value, :string
  end
end
