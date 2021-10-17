class User < ApplicationRecord
  include ImageUploader::Attachment(:avatar)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :jadwal_vote

  acts_as_voter

  def validate_jadwal_vote
    if ((jadwal_vote.start_time)..(jadwal_vote.end_time)).cover?(Time.zone.now)
      true
    else
      false
    end
  end
end
