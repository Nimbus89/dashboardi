class MappingFunction < ActiveRecord::Base
  belongs_to :project
  has_many :range_mappings
  accepts_nested_attributes_for :range_mappings, allow_destroy: true
end
