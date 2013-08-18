class ApplicationController < ActionController::Base
  protect_from_forgery



# defining here all the private methods that we want to be inherit for more than
  # one controller. In this example so far..:
  # projects_controller
  # admin/base_controller
  private
  def authorize_admin!
    authenticate_user! # This is a devise method to authenticate that the user exist.
    unless current_user.admin? # if the user exist, then we check if the user is an admin.
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
end
