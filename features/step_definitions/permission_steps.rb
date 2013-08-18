When(/^"([^"]*)" can view the "([^"]*)" project$/) do |user, project|
  #permissionUser =  User.find_by_email(user)  # we could use this, and above, the permissionUser.id, or just
  # the User.find_by_email(user).id, without the .id it won't work, the user_id will be nill
  #permissionProject = Project.find_by_name(project)
  Permission.create!(:user_id => User.find_by_email(user).id, :thing => Project.find_by_name(project), :action => "view")
end