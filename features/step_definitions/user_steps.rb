Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete("unconfirmed") == "true" # this will delete the attribute unconfirmed from first
    # scenario on the signing_in.feature but it's also make a variable unconfirmed true (2 in one action)
    @user = User.create!(attributes)
    @user.confirm! unless unconfirmed  # this is work for the second scenario check rails 3 in action page 152.
  end
end