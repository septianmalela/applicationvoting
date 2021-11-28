class Admin::HomesController < Admin::BaseController
  before_action :get_jadwal_vote, only: %i[show_vote_post show_user_vote show_user_unvote]
  before_action :jadwal_vote, only: %i[show_vote_post show_user_vote show_user_unvote]

  def index
    @posts = Post.all
  end

  def show_vote_post
    @post = Post.find(params[:id])
    @user_votes = @post.votes_for.includes(voter: [:jadwal_vote])
    @user_votes1 = @user_votes.count
    if params[:jadwal_vote_id].present?
      @users = User.where(jadwal_vote_id: params[:jadwal_vote_id])

      @user_votes = @user_votes.includes(voter: [:jadwal_vote]).where(voter_id: @users.ids)
      @user_votes2 = @user_votes.count
    end
  end

  def show_user_vote
    @user_ids = User.get_vote_user
    @user_votes = User.where(id: @user_ids)
    @user_votes1 = @user_votes.count
    if params[:jadwal_vote_id].present?
      @user_votes = @user_votes.where(jadwal_vote: @jadwal_vote)
      @user_votes2 = @user_votes.count
    end
  end

  def show_user_unvote
    @user_ids = User.get_unvote_user
    @user_unvotes = User.includes(:jadwal_vote).where(id: @user_ids)
    @user_unvotes1 = @user_unvotes.count
    if params[:jadwal_vote_id].present?
      @user_unvotes = @user_unvotes.includes(:jadwal_vote).where(jadwal_vote: @jadwal_vote)
      @user_unvotes2 = @user_unvotes.count
    end
  end

  private

  def get_jadwal_vote
    @jadwal_votes = JadwalVote.order(start_time: :desc)
  end

  def jadwal_vote
    @jadwal_vote = JadwalVote.find(params[:jadwal_vote_id]) if params[:jadwal_vote_id].present?
  end
end