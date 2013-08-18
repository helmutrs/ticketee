require 'spec_helper'
#before_filter
describe ProjectsController do
  let(:user) do
    create_user!
  end

  let(:project) {FactoryGirl.create(:project) } # using this in conjunction with line 22, for project.id

  context "standard users" do
    #it "cannot access the new action" do # replacing this to test it on all the REST resources, not only on the new action.
      {
        "new" => "get",
        "create" => "post",
        "edit" => "get",
        "update" => "put",
        "destroy" => 'delete' }.each do |action, method|
      it "cannot access the #{action}" do
        sign_in(:user, user)
        send(method, action.dup, :id => project.id)
        response.should redirect_to(root_path)
        flash[:alert].should eql("You must be an admin to do that.")
      end
      end

    it 'cannot access the show action' do
      sign_in(:user, user)
      get :show, :id => project.id
      response.should redirect_to(projects_path)
      flash[:alert].should eql('The project you were looking for could not be found.')
    end

    it 'display an error for a missing project' do
      sign_in(:user, user)
      get :show, :id => 'not-here'
      response.should redirect_to(projects_path)
      message = 'The project you were looking for could not be found.'
      flash[:alert].should eql(message)
    end
  end
end


