When(/^"([^"]*)" can view the "([^"]*)" project$/) do |user, project|
  #permissionUser =  User.find_by_email(user)
  #permissionProject = Project.find_by_name(project)
  Permission.create!(:user_id => User.find_by_email(user), :thing => Project.find_by_name(project), :action => "view")
end