class AddLabelPanel < ActiveRecord::Migration
  def self.up
  	label = PanelType.create( name: "label", sizex: 240, sizey: 80)
  	PanelField.create(  name: "key", field_type: "text_field", panel_type: label )
  	PanelField.create(  name: "default_text", field_type: "text_field", panel_type: label )
  end

  def self.down
  	(PanelType.find_by name:"label").panel_fields.delete_all
  	(PanelType.find_by name:"label").destroy
  end
end
