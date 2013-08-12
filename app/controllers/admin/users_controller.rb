class Admin::UsersController < Admin::BaseController #inheritance
  def index
    @users = User.all(:order => "email")
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User has been created."
      @user.confirm!
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been created."
      render :action => 'new'
    end
  end
end
