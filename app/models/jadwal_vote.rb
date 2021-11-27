class JadwalVote < ApplicationRecord
  has_many :users

  validates :angkatan, uniqueness: true

  after_create :update_jadwal_vote
  after_update :update_jadwal_vote

  private

  def update_jadwal_vote
    list_user = User.where(angkatan: self.angkatan)

    return nil if list_user.blank?

    list_user.each do |user|
      user.jadwal_vote = self
      user.save(validate: false)
    end
  end
end
