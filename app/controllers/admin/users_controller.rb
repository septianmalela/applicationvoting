class Admin::UsersController < Admin::BaseController
  def index
    @users = User.order(active_user: :DESC)
  end

  def show
    @user = User.find(params[:id])
  end

  def active_user
    @user = User.find(params[:id])
    if @user.update(active_user: true)
      flash[:notice] = "User #{@user.full_name} Activated!"
    else
      flash[:alert] = "#{@user.errors.messages}"
    end
    redirect_to admin_users_path
  end

  def nonactive_user
    @user = User.find(params[:id])
    if @user.update(active_user: false)
      flash[:notice] = "User #{@user.full_name} Not Active!"
    else
      flash[:alert] = "#{@user.errors.messages}"
    end
    redirect_to admin_users_path
  end
end