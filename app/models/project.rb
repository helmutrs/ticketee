class Project < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true # Validating that the is a presence of name before submit to db
end
