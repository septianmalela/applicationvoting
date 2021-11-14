class Admin::UsersController < Admin::BaseController
  before_action :set_angkatan, only: :update

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user = @user.update(user_params)
      redirect_to admin_user_path(params[:id])
      flash[:notice] = 'User succesfully updated.'
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:angkatan, :jadwal_vote_id, :email, :full_name)
  end

  def set_angkatan
    params[:user][:angkatan] = params[:user][:angkatan].to_i
  end
end