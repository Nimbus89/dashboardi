class AddPieChartPanel < ActiveRecord::Migration
  def self.up
  	pie_chart = PanelType.create( name: "pie_chart", sizex: 160, sizey: 160)
  	PanelField.create(  name: "keys", field_type: "string_array", panel_type: pie_chart )
  	PanelField.create(  name: "colours", field_type: "colour_array", panel_type: pie_chart )
  end

  def self.down
  	(PanelType.find_by name:"pie_chart").panel_fields.delete_all
  	(PanelType.find_by name:"pie_chart").destroy
  end
end
