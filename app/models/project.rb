class Project < ActiveRecord::Base
  attr_accessible :name
  has_many :tickets
  validates :name, :presence => true # Validating that the is a presence of name before submit to db
end
