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
      flash[:notice] = 'Jadwal vote succesfully created.'
    else
      render :new
    end
  end

  def update
    @jadwal_vote = JadwalVote.find(params[:id])

    if @jadwal_vote = @jadwal_vote.update(jadwal_vote_params)
      redirect_to admin_jadwal_votes_path
      flash[:notice] = 'Jadwal vote succesfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @jadwal_vote = JadwalVote.find(params[:id])

    begin
      @jadwal_vote.destroy
      redirect_to admin_jadwal_votes_path
      flash[:notice] = 'Jadwal vote succesfully destroyed.'
    rescue ActiveRecord::InvalidForeignKey => e
      redirect_to admin_jadwal_votes_path
      flash[:alert] = 'Jadwal vote used by user'
    end
  end

  private

  def jadwal_vote_params
    params.require(:jadwal_vote).permit(:start_time, :end_time, :angkatan)
  end
end