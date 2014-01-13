class Page < ActiveRecord::Base
	belongs_to :project
	has_many :panels
	accepts_nested_attributes_for :panels

	validates :name, presence: true
	validates :name, uniqueness: { scope: :project, message: "This project already has a page of that name"}
end
