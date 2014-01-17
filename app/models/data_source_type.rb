class DataSourceType < ActiveRecord::Base
	has_many :data_source_fields
end
