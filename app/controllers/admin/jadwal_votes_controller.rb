class Admin::JadwalVotesController < Admin::BaseController

  def index
    @jadwal_votes = JadwalVote.all
  end

  def new
    @jadwal_vote = JadwalVote.new
  end

  def edit
    @jadwal_vote = JadwalVote.find(params[:id])
  end

  def create
    @jadwal_vote = JadwalVote.new(jadwal_vote_params)

    if @jadwal_vote.save
      redirect_to admin_jadwal_votes_path
    else
      render :new
    end
  end

  def update
    @jadwal_vote = JadwalVote.find(params[:id])

    if @jadwal_vote = @jadwal_vote.update(jadwal_vote_params)
      redirect_to admin_jadwal_votes_path
    else
      render :edit
    end
  end

  private

  def jadwal_vote_params
    params.require(:jadwal_vote).permit(:start_time, :end_time)
  end
end