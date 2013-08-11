# We create the directory and the file to support
# so far the user_factory.rb directory, to make sure
# the rspec load FactoryGirl .
Dir[Rails.root + "factories/*.rb"].each do |file|
  require file
end