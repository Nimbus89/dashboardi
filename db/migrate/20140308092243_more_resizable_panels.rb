class MoreResizablePanels < ActiveRecord::Migration
  def self.up
	timeseries = PanelType.find_by name:"timeseries"
	timeseries.sizex = 0
	timeseries.sizey = 0
	timeseries.save()
	PanelField.create(  name: "width", field_type: "text_field", default_value: "28", panel_type: timeseries )
	PanelField.create(  name: "height", field_type: "text_field", default_value: "16", panel_type: timeseries )

	navbutton = PanelType.find_by name:"navbutton"
	navbutton.sizex = 0
	navbutton.sizey = 0
	navbutton.save()
	PanelField.create(  name: "width", field_type: "text_field", default_value: "8", panel_type: navbutton )
	PanelField.create(  name: "height", field_type: "text_field", default_value: "4", panel_type: navbutton )

	image = PanelType.find_by name:"image"
	image.sizex = 0
	image.sizey = 0
	image.save()
	PanelField.create(  name: "width", field_type: "text_field", default_value: "10", panel_type: image )
	PanelField.create(  name: "height", field_type: "text_field", default_value: "10", panel_type: image )

	bar_chart = PanelType.find_by name:"bar_chart"
	bar_chart.sizex = 0
	bar_chart.sizey = 0
	bar_chart.save()
	PanelField.create(  name: "width", field_type: "text_field", default_value: "12", panel_type: bar_chart )
	PanelField.create(  name: "height", field_type: "text_field", default_value: "10", panel_type: bar_chart )

	gaugepanel = PanelType.find_by name:"gaugepanel"
	gaugepanel.sizex = 0
	gaugepanel.sizey = 0
	gaugepanel.save()
	PanelField.create(  name: "size", field_type: "text_field", default_value: "8", panel_type: gaugepanel )

	pie_chart = PanelType.find_by name:"pie_chart"
	pie_chart.sizex = 0
	pie_chart.sizey = 0
	pie_chart.save()
	PanelField.create(  name: "size", field_type: "text_field", default_value: "8", panel_type: pie_chart )

	doughnut_chart = PanelType.find_by name:"doughnut_chart"
	doughnut_chart.sizex = 0
	doughnut_chart.sizey = 0
	doughnut_chart.save()
	PanelField.create(  name: "size", field_type: "text_field", default_value: "8", panel_type: doughnut_chart )

	radar_chart = PanelType.find_by name:"radar_chart"
	radar_chart.sizex = 0
	radar_chart.sizey = 0
	radar_chart.save()
	PanelField.create(  name: "size", field_type: "text_field", default_value: "8", panel_type: radar_chart )

	polar_chart = PanelType.find_by name:"polar_chart"
	polar_chart.sizex = 0
	polar_chart.sizey = 0
	polar_chart.save()
	PanelField.create(  name: "size", field_type: "text_field", default_value: "8", panel_type: polar_chart )
  end

  def self.down

	#Write Me

  end
end
