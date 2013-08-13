class Admin::UsersController < Admin::BaseController #inheritance
  before_filter :find_user,  :only => [:show, :edit, :destroy, :update]
  before_filter :admin_status, :only => [:update, :create]

  def index
    @users = User.all(:order => "email")
  end

  def show
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "User has been created."
      #@user.update_attribute("admin", admin) if admin
      @user.update_attribute("admin", @admin) if @admin == "1"
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been created."
      render :action => 'new'
    end
  end

  def edit

  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update_attributes(params[:user])
      flash[:notice] = "User has been updated."
      @user.update_attribute("admin", @admin) if @admin == "1"
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    if @user == current_user
      flash[:alert] = "You cannot delete yourself!"
    else
      @user.destroy
      flash[:notice] = "User has been deleted."
    end
    redirect_to admin_users_path # either way, always return to index to show the success or failure message
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def admin_status
    params[:user].delete(:admin) == "1" ? @admin = "1" : @admin = "0"
  end
end
