class ChangeDynSizeToWidthHeight < ActiveRecord::Migration
  def self.up
	label = PanelType.find_by name:"label"
	x = (label.panel_fields.find_by name:"dyn_size_x")
	x.name = "width"
	x.save()
	y = (label.panel_fields.find_by name:"dyn_size_y")
	y.name = "height"
	y.save()
	label.save()
  end

  def self.down
	label = PanelType.find_by name:"label"
	x = (label.panel_fields.find_by name:"width")
	x.name = "dyn_size_x"
	x.save()
	y = (label.panel_fields.find_by name:"height")
	y.name = "dyn_size_y"
	y.save()
	label.save()
  end
end
