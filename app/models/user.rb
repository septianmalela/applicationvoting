class User < ApplicationRecord
  include ImageUploader::Attachment(:avatar)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :jadwal_vote

  acts_as_voter

  def self.get_vote_user
    jumlah_vote = []
    self.all.each do |user|
      jumlah_vote.push(1) if user.votes.present?
    end
    jumlah_vote.count
  end

  def self.get_unvote_user
    jumlah_unvote = []
    self.all.each do |user|
      jumlah_unvote.push(1) if user.votes.blank?
    end
    jumlah_unvote.count
  end

  def validate_jadwal_vote
    if ((jadwal_vote.start_time)..(jadwal_vote.end_time)).cover?(Time.zone.now)
      true
    else
      false
    end
  end
end
