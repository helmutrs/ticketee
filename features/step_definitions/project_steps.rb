require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "path"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I follow the first "([^"]*)"$/ do |link|
  #click_link link
	all('a').select {|elt| elt.text == "#{link}" }.first.click  # this will solve the ambiguous issues
end

When /^I follow "([^"]*)"$/ do |link|
	click_link link
end
When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in field, :with => value
end

Then /^I should see "([^"]*)"$/ do |content|
  page.should have_content(content)
end

Then /^I should see '([^"]*)' on the head title$/ do |title|
  page.should have_title(title)
end

Then /^I should be on the project page for "([^"]*)"$/ do |name|
  project_path(Project.find_by_name!(name))
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Given /^there is a project called "([^\"]*)"$/ do |name|
  @project = FactoryGirl.create(:project, :name => name)   # the name here is what we're going to replace the default name with.
end

Then /^I should not see "([^"]*)"$/ do |arg|
  page.should_not have_content(arg)
end

When /^that project has a ticket:$/ do |table|
  # table is a | Make it shiny!  | Gradients! Starbursts! Oh my! |pending
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end

Then /^(?:|I )should see "([^"]*)" within (.*)$/ do |text, parent|
  with_scope(parent) do
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

When /^I check "([^"]*)"$/ do |field|
  check(field)
end

When /^I uncheck "([^"]*)"$/ do |field|
  uncheck(field)
end