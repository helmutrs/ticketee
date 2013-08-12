module SeeHelpers
  def create_user!(attributes={})
    user = FactoryGirl.create(:user, attributes)
    user.confirm!
    user
  end
end

RSpec.configure do |config| # we created our module, and then we tell the RSpec that should be include this helper
  config.include SeeHelpers
end