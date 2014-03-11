class AddPolarChartPanel < ActiveRecord::Migration
  def self.up
  	polar_chart = PanelType.create( name: "polar_chart", sizex: 160, sizey: 160)
  	PanelField.create(  name: "keys", field_type: "string_array", panel_type: polar_chart )
  	PanelField.create(  name: "colours", field_type: "colour_array", panel_type: polar_chart )
  end

  def self.down
    polar_chart = PanelType.find_by name:"polar_chart"
    Panel.where(panel_type: polar_chart).delete_all
  	polar_chart.panel_fields.delete_all
  	polar_chart.destroy
  end
end
