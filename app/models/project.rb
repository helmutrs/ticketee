class Project < ActiveRecord::Base
  # attributes (columns) that we can use
  attr_accessible :name

  # relation with other tables
  has_many :tickets, :dependent => :delete_all #once the project is delete all tickets from it.

  # validations
  validates :name, :presence => true # Validating that the is a presence of name before submit to db
end
