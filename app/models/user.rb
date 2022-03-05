class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_create :create_activation_digest
  validates :name, presence: true 
  validates :email, presence: true
  validates :name, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\_.]+@[a-z\d\_.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255}, 
              format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :microposts, dependent: :destroy

  attr_accessor :remember_token, :activation_token, :reset_token

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  # def authenticated?(remember_token)
  #   BCrypt::Password.new(remember_digest).is_password?(remember_token)
  # end


  # remember_digest, activation_digestのどちらでも同じメソッドを使えるようにする
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    BCrypt::Password.new(digest).is_password?(token)    
  end


  def forget
    update_attribute(:remember_digest, nil)
  end

  def activate
    update_attribute(:activated, true )
    update_attribute(:activated_at, Time.zone.now )
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def send_reset_password_email
    UserMailer.password_reset(self).deliver_now
  end

  
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def password_reset_expired?
    self.reset_sent_at < 2.hours.ago
  end


  def feed
    Micropost.where("user_id = ?", id)
  end

  private
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end



end
