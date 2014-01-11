# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
PanelField.create( name: "navagate_to", field_type: "text_field", panel_type: navbutton)
PanelField.create( name: "link_text", field_type: "text_field", panel_type: navbutton)

timeseries = PanelType.create( name: "timeseries", sizex: 560, sizey: 320 )
PanelField.create( name: "ymax", field_type: "text_field", panel_type: timeseries)
PanelField.create( name: "ymin", field_type: "text_field", panel_type: timeseries)
PanelField.create( name: "resolution", field_type: "text_field", panel_type: timeseries)
PanelField.create( name: "refreshRate", field_type: "text_field", panel_type: timeseries)
PanelField.create( name: "keys", field_type: "string_array", panel_type: timeseries)