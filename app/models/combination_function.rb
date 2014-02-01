class CombinationFunction < ActiveRecord::Base
  belongs_to :project
  has_many :input_keys
  accepts_nested_attributes_for :input_keys, allow_destroy: true
end
