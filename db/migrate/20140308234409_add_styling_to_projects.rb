class AddStylingToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :background_colour, :string, :default => "black"
  	add_column :projects, :foreground_colour, :string, :default => "grey"
  	add_column :projects, :panel_colour, :string, :default => "white"
  	add_column :projects, :text_colour, :string, :default => "black"
  end
end
