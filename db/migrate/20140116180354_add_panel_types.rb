class AddPanelTypes < ActiveRecord::Migration
  def self.up
	valuepanel = PanelType.create( name: "value", sizex: 240, sizey: 160 )
	PanelField.create( name: "title", field_type: "text_field", panel_type: valuepanel)
	PanelField.create( name: "unit", field_type: "text_field", panel_type: valuepanel)
	PanelField.create( name: "key", field_type: "text_field", panel_type: valuepanel)

	gaugepanel = PanelType.create( name: "gaugepanel", sizex: 160, sizey: 160 )
	PanelField.create( name: "title", field_type: "text_field", panel_type: gaugepanel)
	PanelField.create( name: "key", field_type: "text_field", panel_type: gaugepanel)
	PanelField.create( name: "min", field_type: "text_field", panel_type: gaugepanel)
	PanelField.create( name: "max", field_type: "text_field", panel_type: gaugepanel)

	navbutton = PanelType.create( name: "navbutton", sizex: 160, sizey: 80 )
	PanelField.create( name: "navagate_to", field_type: "page_select", panel_type: navbutton)
	PanelField.create( name: "link_text", field_type: "text_field", panel_type: navbutton)

	timeseries = PanelType.create( name: "timeseries", sizex: 560, sizey: 320 )
	PanelField.create( name: "ymax", field_type: "text_field", panel_type: timeseries)
	PanelField.create( name: "ymin", field_type: "text_field", panel_type: timeseries)
	PanelField.create( name: "resolution", field_type: "text_field", panel_type: timeseries)
	PanelField.create( name: "refreshRate", field_type: "text_field", panel_type: timeseries)
	PanelField.create( name: "keys", field_type: "string_array", panel_type: timeseries)
  end

  def self.down
  	PanelType.delete_all
  	PanelField.delete_all
  end
end
