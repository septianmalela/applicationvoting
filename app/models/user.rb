class User < ApplicationRecord
  include ImageUploader::Attachment(:avatar)

  acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # :confirmable

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
    self.all.each do |user|
      jumlah_vote.push(user.id) if user.votes.present?
    end
    jumlah_vote
  end

  def self.get_unvote_user
    jumlah_unvote = []
    self.all.each do |user|
      jumlah_unvote.push(user.id) if user.votes.blank?
    end
    jumlah_unvote
  end

  def jadwal_vote_angkatan(jadwal)
    self.update(jadwal_vote: jadwal)
  end

  def set_jadwal_vote
    return nil if jadwal_vote.present?

    if angkatan.eql?(17)
      jadwal_vote_angkatan(JadwalVote.fourth)
    elsif angkatan.eql?(18)
      jadwal_vote_angkatan(JadwalVote.third)
    elsif angkatan.eql?(19)
      jadwal_vote_angkatan(JadwalVote.second)
    elsif angkatan.eql?(20)
      jadwal_vote_angkatan(JadwalVote.first)
    end
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
