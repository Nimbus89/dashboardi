class PanelField < ActiveRecord::Base
  belongs_to :panel_type, foreign_key: "panel_type_id"
end
