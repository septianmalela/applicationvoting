class User::HomesController < User::BaseController
  def index
    @posts = Post.all
  end

  def vote
    @post = Post.find(params[:id])
    @user = current_user

    if @post.vote_by :voter => @user
      flash[:notice] = "Successfully Voted #{@post.name_1}"
      redirect_to root_path
    else
      flash[:alert] = "Failed Voted!"
      redirect_to root_path
    end
  end
end