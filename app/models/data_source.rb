class DataSource < ActiveRecord::Base
  belongs_to :data_source_type
  belongs_to :project
  serialize :fields, Hash
end
