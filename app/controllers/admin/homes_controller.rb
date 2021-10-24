class Admin::HomesController < Admin::BaseController
  def index
    @posts = Post.all
  end

  def show_vote_post
    @post = Post.find(params[:id])
    @user_votes = @post.votes_for
  end

  def show_user_vote
    @user_ids = User.get_vote_user
    @user_votes = User.where(id: @user_ids)
  end

  def show_user_unvote
    @user_ids = User.get_unvote_user
    @user_unvotes = User.where(id: @user_ids)
  end
end