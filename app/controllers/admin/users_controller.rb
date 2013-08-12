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
    params[:user].delete("admin") == "1" ? admin = "1" : admin = "0"
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "User has been created."
      #@user.update_attribute("admin", admin) if admin
      @user.update_attribute("admin", admin) if admin == "1"
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been created."
      render :action => 'new'
    end
  end
end
