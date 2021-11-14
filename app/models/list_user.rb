class ListUser < ApplicationRecord 
  validates :email, uniqueness: true
  validate :check_email

  def check_email
    check_email = email.split('@')
    return self.errors.add(:base, 'Invalid email! please use email UNPAD!!!') unless check_email.last.eql?('mail.unpad.ac.id')
  end
end
