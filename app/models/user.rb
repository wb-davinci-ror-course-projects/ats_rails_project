class User < ActiveRecord::Base
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email_address, presence: true
  validates :email_address, uniqueness: true
  has_secure_password
end

