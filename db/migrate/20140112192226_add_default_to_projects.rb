class AddDefaultToProjects < ActiveRecord::Migration
  def change
    change_column :projects, :screensize_x, :integer, :default => 800
    change_column :projects, :screensize_y, :integer, :default => 600
  end
end
