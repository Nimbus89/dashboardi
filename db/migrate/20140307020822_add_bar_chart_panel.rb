class AddBarChartPanel < ActiveRecord::Migration
  def self.up
  	bar_chart = PanelType.create( name: "bar_chart", sizex: 320, sizey: 200)
  	PanelField.create(  name: "keys", field_type: "string_array", panel_type: bar_chart )
  	PanelField.create(  name: "labels", field_type: "string_array", panel_type: bar_chart )
  	PanelField.create(  name: "colour", field_type: "colour", panel_type: bar_chart )
  end

  def self.down
    bar_chart = PanelType.find_by name:"bar_chart"
    Panel.where(panel_type: bar_chart).delete_all
  	bar_chart.panel_fields.delete_all
  	bar_chart.destroy
  end
end
