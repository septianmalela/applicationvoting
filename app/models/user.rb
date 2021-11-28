class User < ApplicationRecord
  include ImageUploader::Attachment(:avatar)

  acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  attr_accessor :email_for_test

  after_create :set_jadwal_vote

  belongs_to :jadwal_vote, optional: true

  validate :check_user
  validate :check_email, unless: :email_test?

  # instance method

  def email_test?
    self.email_for_test
  end

  def self.get_vote_user
    jumlah_vote = []
    User.includes(:votes).each do |user|
      jumlah_vote.push(user.id) if user.votes.present?
    end
    jumlah_vote
  end

  def self.get_unvote_user
    jumlah_unvote = []
    User.includes(:votes).each do |user|
      jumlah_unvote.push(user.id) if user.votes.blank?
    end
    jumlah_unvote
  end

  def jadwal_vote_angkatan(jadwal)
    self.update(jadwal_vote: jadwal)
  end

  def set_jadwal_vote
    return nil if jadwal_vote.present?

    self.update(jadwal_vote: JadwalVote.find_by(angkatan: self.angkatan))
  end

  def self.user_update_jadwal_vote(user_ids, jadwal_vote_id)
    jadwal_vote = JadwalVote.find(jadwal_vote_id)
    hasil = []
    User.where(id: user_ids).each do |user|
      updated = user.update(jadwal_vote: jadwal_vote)
      hasil.push(updated)
    end
    hasil
  end

  def validate_jadwal_vote
    return nil if jadwal_vote.blank?

    if ((jadwal_vote.start_time)..(jadwal_vote.end_time)).cover?(Time.zone.now)
      true
    else
      false
    end
  end

  # Validate Method

  def check_user
    list_user = ListUser.find_by(email: email)
    return error_messages if list_user.blank?

    self.angkatan = list_user.angkatan
  end

  def check_email
    check_email = email.split('@')
    return self.errors.add(:base, 'Invalid email! please use email UNPAD!!!') unless check_email.last.eql?('mail.unpad.ac.id')
  end

  def error_messages
    self.errors.add(:base, 'Your email not registered, please contact Admin!!')
  end
end
