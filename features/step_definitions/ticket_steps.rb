When /^"([^"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(:user_id => User.find_by_email!(email).id);
    @project.tickets.create!(attributes)
  end
end