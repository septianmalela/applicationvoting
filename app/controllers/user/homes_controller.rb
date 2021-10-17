class User::HomesController < User::BaseController
  def index
    @posts = Post.order(created_at: :DESC)
  end

  def vote
    @post = Post.find(params[:id])
    @user = current_user

    if @post.vote_by :voter => @user
      flash[:notice] = "Successfully Voted"
      redirect_to root_path
    else
      flash[:alert] = "Failed Voted!"
      redirect_to root_path
    end
  end
end