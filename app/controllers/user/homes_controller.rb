class User::HomesController < User::BaseController
  def index
    @posts = Post.order(created_at: :DESC)
  end

  def vote
    @post = Post.find(params[:id])
    @user = current_user

    if current_user.validate_jadwal_vote
      if @post.vote_by :voter => @user
        flash[:notice] = "Successfully Voted"
        redirect_to root_path
      else
        flash[:alert] = "Failed Voted!"
        redirect_to root_path
      end
    else
      jadwal_vote_user = "#{date_time(current_user.jadwal_vote.start_time)} - #{get_time(current_user.jadwal_vote.end_time)}"
      flash[:alert] = "Jadwal Vote Kamu Tanggal #{jadwal_vote_user}"
      redirect_to root_path
    end

  end
end