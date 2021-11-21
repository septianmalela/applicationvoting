class ListUser < ApplicationRecord
  attr_accessor :skip

  validates :email, uniqueness: true
  # validate :check_email, unless: :skip_validation

  def check_email
    check_email = email.split('@')
    return self.errors.add(:base, 'Invalid email! please use email UNPAD!!!') unless check_email.last.eql?('mail.unpad.ac.id')
  end

  def skip_validation
    return true if skip.eql?(true)
  end
end
