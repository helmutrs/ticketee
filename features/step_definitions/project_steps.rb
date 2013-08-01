Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end
When /^I follow "([^"]*)"$/ do |link|
  click_link link
end
When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in field, :with => value
end
#When /^(?:|I )press "([^"]*)"$/ do |button|
#  click_link(button)  --> Rubymine did it below for me?
#end
Then /^I should see "([^"]*)"$/ do |content|
  page.should have_content?(content)
end

Then /^I should see '(.+)'$/ do |content|
  page.should
end
Then /^I should be on the project page for "([^"]*)"$/ do |name|
  project_path(Project.find_by_name!(name))
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Given /^there is a project called "([^\"]*)"$/ do |name|
  FactoryGirl.create(:project, :name => name)
end