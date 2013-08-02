require 'spec_helper'
before_filter
describe ProjectsController do
  it "display an error for a missing project" do
    get :show, :id => "not-here"
    response.should redirect_to(projecs_path)
    message = 'The project you were looking for could not be found.'
    flash[:alert].should eql(message)
  end
end
