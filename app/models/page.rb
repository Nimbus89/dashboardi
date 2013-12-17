class Page < ActiveRecord::Base
	belongs_to :project
	has_many :panels
	accepts_nested_attributes_for :panels
end
