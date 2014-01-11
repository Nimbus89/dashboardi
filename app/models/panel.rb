class Panel < ActiveRecord::Base
	belongs_to :panel_type
	belongs_to :page
	serialize :properties, Hash
end
