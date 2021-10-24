class User < ApplicationRecord
  include ImageUploader::Attachment(:avatar)

  acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  attr_accessor :email_for_test

  belongs_to :jadwal_vote, optional: true

  validate :check_email, unless: :email_test?

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

  def validate_jadwal_vote
    if ((jadwal_vote.start_time)..(jadwal_vote.end_time)).cover?(Time.zone.now)
      true
    else
      false
    end
  end

  def check_email
    check_email = email.split('@')
    return self.errors.add(:base, 'Invalid Email! Please Use Email UNPAD!!!') unless check_email.last.eql?('mail.unpad.ac.id')
  end

  def email_test?
    self.email_for_test
  end
end
