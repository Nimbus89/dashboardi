class PanelType < ActiveRecord::Base
	has_many :panel_fields
	accepts_nested_attributes_for :panel_fields, allow_destroy: true
end
