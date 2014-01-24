class AddImagePanel < ActiveRecord::Migration
  def self.up
  	image = PanelType.create( name: "image", sizex: 160, sizey: 160)
  	PanelField.create(  name: "key", field_type: "text_field", panel_type: image )
  	PanelField.create(  name: "images", field_type: "string_array", panel_type: image )
  end

  def self.down
  	(PanelType.find_by name:"image").panel_fields.delete_all
  	(PanelType.find_by name:"image").destroy
  end
end
