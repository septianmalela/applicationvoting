class User::HomesController < User::BaseController
  before_action :cache_video, only: :tutorial

  def index
    @posts = Post.order(created_at: :DESC)
  end

  def vote
    @post = Post.find(params[:id])
    @user = current_user

    if @user.validate_jadwal_vote
      if @post.vote_by :voter => @user
        @post.update(total_vote: @post.votes_for.size)
        VoteMailer.with(user: @user, post: @post).vote_email.deliver_now
        flash[:notice] = "Successfully Voted"
        redirect_to root_path
      else
        flash[:alert] = "Failed Voted!"
        redirect_to root_path
      end
    else
      jadwal_vote_user = "#{date_time(current_user.try(:jadwal_vote).try(:start_time))} -
                          #{get_time(current_user.try(:jadwal_vote).try(:end_time))}"
      flash[:alert] = "Jadwal Vote Kamu Tanggal #{jadwal_vote_user}"
      redirect_to root_path
    end
  end

  def tutorial;end

  def beranda;end

  def about_us;end

  private

  def cache_video
    return if Rails.cache.fetch("video_tutorial").present?

    Rails.cache.fetch("video_tutorial", expires_in: 7.days) do
      "https://drive.google.com/file/d/1mlfanF_dSdF7cv-kw9fYXQ0Krax9vv6x/preview"
    end
  end
end