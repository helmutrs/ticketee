require 'spec_helper'

describe TicketsController do
	let(:user)    {create_user!}
	let(:project) { FactoryGirl.create(:project)}
	let(:ticket)  { FactoryGirl.create(:ticket, :project => project, :user => user)}

	context "standard users" do
		it "cannot accesss a ticket for a project" do
			sign_in(:user, user)
			get :show, :id => ticket.id, :project_id => project.id
			response.should redirect_to(root_path)
			flash[:alert].should eql('The project you were looking for is not found.')
		end
	end

end
