class User < ApplicationRecord
  include ImageUploader::Attachment(:avatar)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :jadwal_vote

  acts_as_voter
end
