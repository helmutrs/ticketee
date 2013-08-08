class Ticket < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :project
  belongs_to  :user

  attr_accessible :title, :description, :project_id, :user_id
  validates :title, :presence => true # Validating that the is a presence of name before submit to db
  validates :description, :presence => true, :length => {:minimum => 10}
end
