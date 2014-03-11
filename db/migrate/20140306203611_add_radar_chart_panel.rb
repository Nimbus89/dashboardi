class AddRadarChartPanel < ActiveRecord::Migration
  def self.up
  	radar_chart = PanelType.create( name: "radar_chart", sizex: 160, sizey: 160)
  	PanelField.create(  name: "keys", field_type: "string_array", panel_type: radar_chart )
  	PanelField.create(  name: "labels", field_type: "string_array", panel_type: radar_chart )
  	PanelField.create(  name: "colour", field_type: "colour", panel_type: radar_chart )
  end

  def self.down
  	(PanelType.find_by name:"radar_chart").panel_fields.delete_all
  	(PanelType.find_by name:"radar_chart").destroy
  end
end
