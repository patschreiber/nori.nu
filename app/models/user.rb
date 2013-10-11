# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  last_name       :string(255)
#  first_name      :string(255)
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  last_name       :string(255)
#  first_name      :string(255)
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_one :users_stat

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

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
