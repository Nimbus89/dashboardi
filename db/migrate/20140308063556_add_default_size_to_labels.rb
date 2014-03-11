class AddDefaultSizeToLabels < ActiveRecord::Migration
  def self.up
	label = PanelType.find_by name:"label"
	x = (label.panel_fields.find_by name:"dyn_size_x")
	x.default_value = "9"
	x.save()
	y = (label.panel_fields.find_by name:"dyn_size_y")
	y.default_value = "4"
	y.save()
	label.save()
  end

  def self.down
	label = PanelType.find_by name:"label"
	x = (label.panel_fields.find_by name:"dyn_size_x")
	x.default_value = ""
	x.save()
	y = (label.panel_fields.find_by name:"dyn_size_y")
	y.default_value = ""
	y.save()
	label.save()
  end
end
