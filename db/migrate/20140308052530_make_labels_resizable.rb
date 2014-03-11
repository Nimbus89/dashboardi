class MakeLabelsResizable < ActiveRecord::Migration
  def self.up
	label = PanelType.find_by name:"label"
	label.sizex = 0
	label.sizey = 0
	label.save()
	PanelField.create(  name: "dyn_size_x", field_type: "text_field", panel_type: label )
	PanelField.create(  name: "dyn_size_y", field_type: "text_field", panel_type: label )
  end

  def self.down
    label = PanelType.find_by name:"label"
  	label.panel_fields.where(name: dyn_size_x).delete_all
  	label.panel_fields.where(name: dyn_size_y).delete_all
	label.sizex = 240
	label.sizey = 80
	label.save()
  end
end
