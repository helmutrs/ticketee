require 'factory_girl'

FactoryGirl.define do
	factory :ticket do |ticket|
		ticket.title 'Title'
		ticket.description 'This is description'
		ticket.user {|user| user.association(:user)}
		ticket.project {|p| p.association(:project)}
	end
end