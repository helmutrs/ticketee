Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete("unconfirmed") == "true" # this will delete the attribute unconfirmed from first
    # scenario on the signing_in.feature but it's also make a variable unconfirmed true (2 in one action)
    @user = User.create!(attributes)
    @user.confirm! unless unconfirmed  # this is work for the second scenario check rails 3 in action page 152.
  end
end

# This method called "steps" is Ruby not rails, we can't use it as we do in Cucumber features. To get around this restriction
# use the "steps" method and specify each step we want to call inside %Q{} a kind of super-String that allows us to use
# double and single quotes inside. The "steps" method then takes each of these steps and runs them as if they were inside
# a feature.
Given (/^I am signed in as them$/) do
  steps(%Q{
    Given I am on the homepage
    When I follow "Sign in"
    And I fill in "Email" with "#{@user.email}"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Signed in successfully."
        })
end