class Admin::ListUsersController < Admin::BaseController

  def index
    @q = ListUser.ransack(params[:q])
    @list_users = @q.result.order(angkatan: :desc).order(created_at: :desc)
  end

  def new
    @list_user = ListUser.new
  end

  def edit
    @list_user = ListUser.find(params[:id])
  end

  def create
    @list_user = ListUser.new(params_list_user)

    if @list_user.save
      redirect_to admin_list_users_path
      flash[:notice] = 'List user succesfully created.'
    else
      flash[:alert] = @list_user.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @list_user = ListUser.find(params[:id])

    if @list_user = @list_user.update(params_list_user)
      redirect_to admin_list_users_path
      flash[:notice] = 'List user succesfully updated.'
    else
      flash[:alert] = @list_user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @list_user = ListUser.find(params[:id])

    if @list_user.destroy
      redirect_to admin_list_users_path
      flash[:notice] = 'List user succesfully destroyed.'
    else
      redirect_to admin_list_users_path
      flash[:alert] = 'Failed destroy'
    end
  end

  private

  def params_list_user
    params.require(:list_user).permit(:email, :name, :angkatan)
  end
end