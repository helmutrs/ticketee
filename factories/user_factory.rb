require 'factory_girl'

# the sequence is a FactoryGirl method which passes a unique
# number to the block and makes your user's email address unique.
FactoryGirl.define do
  factory :user do |user|
    user.sequence(:email) {|n| "user#{n}@ticketee.com"}
    user.password "password"
    user.password_confirmation "password"
  end
end