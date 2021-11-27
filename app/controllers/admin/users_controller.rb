class Admin::UsersController < Admin::BaseController
  before_action :set_angkatan, only: :update

  def index
    if params[:angkatan].present?
      @users = User.includes(:jadwal_vote).where(angkatan: params[:angkatan].to_i)
    else
      @users = User.includes(:jadwal_vote).where(angkatan: nil)
    end
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

  def update_jadwal_vote
    if params[:user_ids].blank? || params[:jadwal_vote].blank?
      flash[:alert] = 'User or Jadwal Vote Is Blank!'
      return redirect_to admin_users_path
    end
    hasil = User.user_update_jadwal_vote(params[:user_ids], params[:jadwal_vote])
    redirect_to admin_users_path(angkatan: params[:angkatan])
    flash[:notice] = "#{hasil.select { |hasil| hasil == true }.count} Update Jadwal Vote Succesfully Updated,
                      #{hasil.select { |hasil| hasil == false }.count} Update Jadwal Vote Failed Updated."
  end

  private

  def user_params
    params.require(:user).permit(:angkatan, :jadwal_vote_id, :email, :full_name)
  end

  def set_angkatan
    params[:user][:angkatan] = params[:user][:angkatan].to_i
  end
end