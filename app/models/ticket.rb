class Ticket < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :description, :project_id
  belongs_to :project
  validates :title, :presence => true # Validating that the is a presence of name before submit to db
  validates :description, :presence => true, :length => {:minimum => 10}
end
