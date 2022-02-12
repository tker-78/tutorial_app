class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true 
  validates :email, presence: true
  validates :name, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\_.]+@[a-z\d\_.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255}, 
              format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
