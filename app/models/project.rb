class Project < ActiveRecord::Base
    belongs_to :user
    has_many :pages
    accepts_nested_attributes_for :pages
    belongs_to :startpage, class_name: "Page"
end
