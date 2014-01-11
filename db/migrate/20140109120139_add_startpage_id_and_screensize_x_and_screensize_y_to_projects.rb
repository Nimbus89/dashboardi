class AddStartpageIdAndScreensizeXAndScreensizeYToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :startpage_id, :integer
    add_column :projects, :screensize_x, :integer
    add_column :projects, :screensize_y, :integer
  end
end
