class AddDoughnutChartPanel < ActiveRecord::Migration
  def self.up
  	doughnut_chart = PanelType.create( name: "doughnut_chart", sizex: 160, sizey: 160)
  	PanelField.create(  name: "keys", field_type: "string_array", panel_type: doughnut_chart )
  	PanelField.create(  name: "colours", field_type: "colour_array", panel_type: doughnut_chart )
  end

  def self.down
  	(PanelType.find_by name:"doughnut_chart").panel_fields.delete_all
  	(PanelType.find_by name:"doughnut_chart").destroy
  end
end
