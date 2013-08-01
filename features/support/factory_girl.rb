# All .rb files in features/support are loaded automatically before  Cucumber starts.
Dir[Rails.root + "factories/*.rb"].each do |file|
  require file
end
