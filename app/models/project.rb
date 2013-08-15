class Project < ActiveRecord::Base
  # attributes (columns) that we can use
  attr_accessible :name

  # relation with other tables
  has_many :tickets, :dependent => :delete_all #once the project is delete all tickets from it.
  has_many :permissions, :as => :thing # as :thing we put it here because it links projects to the thin asssociation on the
  # permission objects.

  # validations
  validates :name, :presence => true # Validating that the is a presence of name before submit to db

  # Generating the scope(s)
  scope :readable_by, lambda { |user|
    joins(:permissions).where(:permissions => {:action => "view",
                                               :user_id => user.id})
  }
end
