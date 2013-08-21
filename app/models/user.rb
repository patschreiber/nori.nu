class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false } 
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  has_secure_password

end