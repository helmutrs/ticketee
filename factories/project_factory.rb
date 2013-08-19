require 'factory_girl'

FactoryGirl.define do
  factory :project do |f|
    f.name "Ticketee"   # here the default name is Ticketee, but if we pass it a name like on the viewing_tickets or
                        # viewing_projects, then it will replace this default name.
  end
end